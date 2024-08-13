# frozen_string_literal: true

require_relative "isbnranges/version"

module ISBNRanges
#  class Error < StandardError; end
  # Your code goes here...

  def load_ranges(range_file)
    ranges = {}
    File.open(range_file, "r") do |f|
      f.each_line do |line|
        next if line.start_with?("#")
        g, r = line.chomp.split(":")
        ranges[g] = r.split(",") unless r.nil?
      end
    end
    ranges
  end
end
