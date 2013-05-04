# LiquidValidator

Is a simple way to validate your Liquid Template strings before creating a
Liquid Template object without raising error. If you do want to raise
an error and handle yourself consider then this gem isn't for you.

This is a very simple gem, that is the point.

## Installation

Add this line to your application's Gemfile:

    gem 'liquid-validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install liquid-validator

## Usage

```ruby
good_tmpl = "Your name is {{name}}"
validator = LiquidValidator::Validate.new(good_tmpl)
validator.valid? # true
validator.errors # []

bad_tmpl  = "Your name is {{name"
validator = LiquidValidator::Validate.new(bad_tmpl)
validator.valid? # false
validator.errors # ["Syntax Error: ..."] (Array of strings)
```

*Note* - That in ```LiquidValidator::Validate.new(tmpl)``` tmpl is a string.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
