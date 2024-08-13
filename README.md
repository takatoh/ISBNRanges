# ISBNRanges

The range definitions of ISBN registration groups and registrants.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add isbnranges

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install isbnranges

## Usage

After `require 'isbnranges'`, you can refer to the following constants:

- ISBNRanges::REGISTRATION_GROUP_RANGES
- ISBNRanges::REGISTRANT_RANGES

Both constants are HASHs with the prefix as the key. The value corresponding to the key is an Array of ranges defined under the prefix. Each range is a String whose beginning and end are joined by `-`, so it can be easily modified into a form that is convenient for you.

    irb(main):001:0> require 'isbnranges'
    => true
    irb(main):002:0> ISBNRanges::REGISTRATION_GROUP_RANGES
    =>
    {"978"=>["0-5", "600-649", "65-65", "7-7", "80-94", "950-989", "9900-9989", "99900-99999"],
     "979"=>["10-15", "8-8"]}
    irb(main):003:0> ISBNRanges::REGISTRANT_RANGES["978-4"]
    => ["00-19", "200-699", "7000-8499", "85000-89999", "900000-949999", "9500000-9999999"]

## License

MIT License

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takatoh/ISBNRanges.
