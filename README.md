# Harshed

Ruby Serializable Hashed Array Utility

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
