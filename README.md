# FinerStruct

A nicer replacement for Ruby's Struct and OpenStruct.

Isn't it annoying how `OpenStruct.new` takes a hash, but the the arguments to `Struct.new` have to be ordered?

Do you find you always use an `OpenStruct` when you don't really care if it's open, you just want an easy way to create an object from a hash?

Did you know that creating an `OpenStruct` blows away Ruby's method cache?

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

### Immutable Structs

Immutable structs can't have their attributes changed after creation.

#### Anonymous immutable structs

    struct = FinerStruct::Immutable.new(a: 1, b: 2)

    struct.a # => 1
    struct.b # => 2
    struct.a = 3 # Exception!

#### Named immutable structs

    class MyStruct < FinerStruct::Immutable(:a, :b)
    struct = MyStruct.new(a: 1, b: 2)

    MyStruct.new(a: 1, b: 2, c: 3) # Exception!

### Mutable Structs

Mutable structs let you assign attributes at any time.

#### Anonymous mutable structs

    struct = FinerStruct::Mutable.new(a: 1, b: 2)

    struct.a = 3
    struct.a # => 3

#### Named mutable structs

    class MyStruct < FinerStruct::Mutable(:a, :b)
    struct = MyStruct.new(a: 1, b: 2)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
