# encoding: utf-8

require_relative "../lib/isbnranges/datafiles"
require "nokogiri"
require "optparse"


def main
  options = {
    dir: "."
  }
  opts = OptionParser.new
  opts.on("-d", "--dir=DIR", String, "Set directory, output range fiels into."){|v|
    options[:dir] = v
  }
  opts.parse!

  doc = File.open(ISBNRanges::RANGE_MESSAGE_FILE, "r"){|f| Nokogiri::XML(f) }

  metadata = {
    source: doc.xpath("//MessageSource").text,
    date: doc.xpath("//MessageDate").text
  }

  registration_groups = extract_ranges(doc.xpath("//EAN.UCC"))
  registrants = extract_ranges(doc.xpath("//Group"))

  output_range_file(
    registration_groups,
    File.join(options[:dir], ISBNRanges::REGISTRATION_GROUP_RANGES_FILE),
    metadata
  )
  output_range_file(
    registrants,
    File.join(options[:dir], ISBNRanges::REGISTRANT_RANGES_FILE),
    metadata
  )
  range_date_file = File.join(options[:dir], ISBNRanges::RANGE_DATE_FILE)
  File.open(range_date_file, "w") do |f|
    f.puts metadata[:date]
  end
  $stderr.puts "Generated: #{range_date_file}"
end

def extract_ranges(nodes)
  nodes.map do |node|
    prefix = node.xpath("Prefix").text
    agency = node.xpath("Agency").text
    ranges = node.xpath("Rules/Rule").map do |rule|
      length = rule.xpath("Length").text.to_i
      range = if length > 0
        rule.xpath("Range").text.split("-").map{|s| s[0, length] }.join("-")
      else
        nil
      end
      range
    end.compact
    {
      "prefix" => prefix,
      "agency" => agency,
      "ranges" => ranges
    }
  end
end

def output_range_file(ranges, range_file, metadata)
  File.open(range_file, "w") do |f|
    f.puts "# Generated from RangeMessage.xml file, downloaded from https://www.isbn-international.org/range_file_generation."
    f.puts "#"
    f.puts "# " + metadata[:source]
    f.puts "# " + metadata[:date]
    f.puts "#"
    ranges.each do |range|
      f.puts "# " + range["agency"]
      f.puts [range["prefix"], range["ranges"].join(","), range["agency"]].join(":")
    end
  end
  $stderr.puts "Generated: #{range_file}"
end



main
