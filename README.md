# FinerStruct

A nicer replacement for Ruby's Struct and OpenStruct.

Isn't it annoying how `OpenStruct.new` takes a hash, but the the arguments to `Struct.new` have to be ordered?

Do you find you always use an `OpenStruct` when you don't really care if it's open, you just want an easy way to create an object from a hash?

Isn't it irritating how you have to remember that, to use `OpenStruct`, you need to `require 'ostruct'`?

Have you ever wished you could create a `Struct` or `OpenStruct`, but make it immutable?

## Installation

Add this line to your application's Gemfile:

    gem 'finer_struct'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install finer_struct

## Usage

### Anonymous structs

    struct = FinerStruct::Immutable.new(a: 1, b: 2)
    struct.a # => 1
    struct.b # => 2

### Named structs

    class MyStruct < FinerStruct::Immutable(:a, :b)
    struct = MyStruct.new(a: 1, b: 2)
    struct.a # => 1
    struct.b # => 2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
