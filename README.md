# ISBNRanges

The range definitions of ISBN registration groups and registrants.

This library provides programmer-friendly versions of data published by International ISBN Agency. It does NOT provide any manipulation of the data.

All ranges of registration groups and registrants are supported.
Those depend on 'RangeMessage.xml' file, downloaded from [International ISBN Agency](https://www.isbn-international.org/range_file_generation).

NOTE: Updated range files to latest version on June 1, 2025.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add isbnranges

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install isbnranges

## Usage

After `require "isbnranges"`, you can refer to the following constants.

- `ISBNRanges::REGISTRATION_GROUP_RANGES`
- `ISBNRanges::REGISTRANT_RANGES`

Both constants are Hash objects with the prefix as the key. The value corresponding to the key is an Array object of ranges defined under the prefix. Each range is an Array object whose beginning and end are included, so it can be easily modified into a form that is convenient for you.

- `ISBNRanges::REGISTRATION_GROUP_AGENCY`

This constant is also a Hash object with the prefix as the key, and the corresponding value is the national agency name to which the prefix is assigned.

- `ISBNRanges::RANGE_DATE`

This constant holds the defined date of the information contained in the range files.

    irb(main):001:0> require "isbnranges"
    => true
    irb(main):002:0> ISBNRanges::REGISTRATION_GROUP_RANGES
    =>
    {"978"=>
      [["0", "5"],
       ["600", "649"],
       ["65", "65"],
       ["7", "7"],
       ["80", "94"],
       ["950", "989"],
       ["9900", "9989"],
       ["99900", "99999"]],
     "979"=>[["10", "15"], ["8", "8"]]}
    irb(main):003:0> ISBNRanges::REGISTRANT_RANGES["978-4"]
    =>
    [["00", "19"],
     ["200", "699"],
     ["7000", "8499"],
     ["85000", "89999"],
     ["900000", "949999"],
     ["9500000", "9999999"]]
    irb(main):004:0> ISBNRanges::REGISTRATION_GROUP_AGENCY["978-4"]
    => "Japan"
    irb(main):005:0> ISBNRanges::RANGE_DATE
    => #<Date: 2024-08-13 ((2460536j,0s,0n),+0s,2299161j)>

## License

MIT License

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takatoh/ISBNRanges.
