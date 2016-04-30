require 'faker'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/unit'
require 'Harshed'

Minitest::Reporters.use!

class TestHashed < Minitest::Test
  include Harshed
  
  def setup
    @widget1 = Widget.test_factory
    @widget2 = Widget.test_factory
    @hashed = Harsh.new(:ean, [@widget1, @widget2])
  end

  def test_store_to_disk
    @hashed.to_disk
    dir = File.join(File.dirname(__FILE__), '..', 'data', @widget1.class.to_s)
    assert Dir.exist?(dir), "Dir.exist?(#{dir})"
    @hashed.rm_r
    refute Dir.exist? dir
  end

  def test_retreive_from_disk
    @hashed.to_disk
    @hashed.from_disk
    @hashed.rm_r
  end

  def test_example
    @heroes = Harsh.new(:character_name, storage_folder: 'characters')
    sir_fumblealot = Character.new('SirFumbleAlot')
    stinky = Character.new('StinkyTheBeggar')
    @heroes.store([sir_fumblealot, stinky])
    @heroes.to_disk

    @heroes_reborn = Harsh.new(:character_name, storage_folder: 'characters').from_disk
    @heroes.rm_r
  end
end

class Widget < Struct.new(:ean, :color)
  def self.test_factory
    Widget.new(Faker::Code.ean, Faker::Color.color_name)
  end
end

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
