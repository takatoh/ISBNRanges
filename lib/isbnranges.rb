# frozen_string_literal: true

require_relative "isbnranges/version"
require_relative "isbnranges/datafiles"
require "date"

module ISBNRanges
#  class Error < StandardError; end
  # Your code goes here...

  extend self

  def load_ranges(range_file)
    ranges = {}
    agencies = {}
    File.open(range_file, "r") do |f|
      f.each_line do |line|
        next if line.start_with?("#")
        g, r, a = line.chomp.split(":")
        ranges[g] = r.split(",").map{|r| r.split("-")} unless r.nil?
        agencies[g] = a unless r.nil?
      end
    end
    [ranges, agencies]
  end

  data_dir = __dir__ + "/../data"
  registration_group_ranges_file = File.join(data_dir, ISBNRanges::REGISTRATION_GROUP_RANGES_FILE)
  registrant_ranges_file = File.join(data_dir, ISBNRanges::REGISTRANT_RANGES_FILE)
  range_date_file = File.join(data_dir, ISBNRanges::RANGE_DATE_FILE)
  REGISTRATION_GROUP_RANGES, _ = load_ranges(registration_group_ranges_file)
  REGISTRANT_RANGES, REGISTRATION_GROUP_AGENCY = load_ranges(registrant_ranges_file)
  RANGE_DATE = Date.parse(File.read(range_date_file))
end
