# Stein

A micro gem that allows [Main][] modes be written in separate files and magically
stitched together.

This may become convenient whem your utility becomes monstrously large
(*8-foot-tall (2.4 m), hideously ugly creation, with translucent yellowish skin
pulled so taut over the body that it "barely disguised the workings of the
vessels and muscles underneath"; watery, glowing eyes, flowing black hair,
black lips, and prominent white teeth.*)

[Main]: https://github.com/ahoward/main

## Installation

Add this line to your application's Gemfile:

    gem 'stein'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stein

## Usage

Start with the main "body" of the utility:

**bin/frankenstein**

```
#!/usr/bin/env ruby
require 'main'
require 'stein'

$LIB_DIR = File.dirname(File.dirname __FILE__) + '/lib'

Main {
  description "Show how to build a monster utility from a bunch of modes"
  def run ; help! ; end
  Stein.extend self, $LIB_DIR + 'modes'
}
```

Then place your modes in lib/modes/:

**lib/modes/feed.rb**

```
Stein.mode 'feed' do
  description "Go to the village and steal some food"
  def run
    go(village)
    food = steal
    eat(food)
  end
end
```

That's it.

### API Reference

**Stein.mode mode_name, &block**: can be used in the top level of a mode-file (a
ruby file in modes directory). It delegates itself to Main DSL's `mode`,
eventually.

**Stein.extend main_module, modes_directory**: loads all modes definitions from
the directory.

## Acknowledgements

Thanks to Ara T. Howard for Main.

Thanks to Mary Shelly for the book.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
