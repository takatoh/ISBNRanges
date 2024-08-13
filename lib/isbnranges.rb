# frozen_string_literal: true

require_relative "isbnranges/version"
require "date"

module ISBNRanges
#  class Error < StandardError; end
  # Your code goes here...

  extend self

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

  data_dir = __dir__ + "/../data"
  REGISTRATION_GROUP_RANGES = load_ranges("#{data_dir}/registration_group_ranges.txt")
  REGISTRANT_RANGES = load_ranges("#{data_dir}/registrant_ranges.txt")
  File.open("#{data_dir}/range_date.txt") do |f|
    RANGE_DATE = Date.parse(f.read)
  end
end
