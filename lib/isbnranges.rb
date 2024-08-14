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
  REGISTRATION_GROUP_RANGES = load_ranges("#{data_dir}/#{ISBNRanges::REGISTRATION_GROUP_RANGES_FILE}")
  REGISTRANT_RANGES = load_ranges("#{data_dir}/#{ISBNRanges::REGISTRANT_RANGES_FILE}")
  RANGE_DATE = Date.parse(File.read("#{data_dir}/#{ISBNRanges::RANGE_DATE_FILE}"))
end
