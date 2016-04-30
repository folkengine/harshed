# Harshed

[![Gem Version](https://badge.fury.io/rb/harshed.svg)](https://badge.fury.io/rb/harshed)
[![Build Status](https://travis-ci.org/folkengine/harshed.svg?branch=master)](https://travis-ci.org/folkengine/harshed)

Ruby Serializable Hashed Array Utility

A Harsh is a hashed array that can be quickly written to and read from disk in a format that can be easily reviewed. 
Take a collection of same type objects. Pick a pivot point, aka, a field unique to each object that can be used as the key 
for the hash. 

I wrote this module to support development/testing techniques that I've grown use to. As a developer I am squarely in the 
[classical, anti-mockist camp](https://agilewarrior.wordpress.com/2015/04/18/classical-vs-mockist-testing/). Harshed helps with that.


Eventually, I'd like to update this module to support the following features:

1. Support for JSON
2. Support for XML
3. Ability to pivot on a field not in the object being serialized.
4. Harshed DB support
5. Deal with the sure to be their defect of spaces on the pivot field

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'harshed'
```

And then execute:

    $> bundle

Or install it yourself as:

    $> gem install harshed

## Usage

      class Character
        attr_reader :character_name, :strength, :dexterity, :constitution, :wisdom, :intelligence, :charisma
    
        def initialize(character_name)
          @character_name = character_name
          @strength = 10
          @dexterity = 10
          @constitution = 10
          @wisdom = 10
          @intelligence = 10
          @charisma = 10
        end
      end
      
      @heroes = Harshed.new(:character_name, storage_folder: 'characters')
      
      sir_fumblealot = Character.new('SirFumbleAlot')
      stinky = Character.new('StinkyTheBeggar')
      
      @heroes.store([sir_fumblealot, stinky])
      
      @heroes.to_disk
      
      @heroes_reborn = Harshed.new(:character_name, storage_folder: 'characters').from_disk
                 
## Development

To run tests, Reek, and RubyCop:

    $> rake boom 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/folkengine/harshed.
