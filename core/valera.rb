require 'yaml'

class Valera
  attr_accessor :health
  attr_accessor :mana
  attr_accessor :money
  attr_accessor :happiness
  attr_accessor :fatigue
  attr_accessor :dead

  def initialize(args)
    @health = args[:health]       # здоровье (0..100)
    @mana = args[:mana]           # мана(алкоголь) (0..100)
    @money = args[:money]         # деньги
    @happiness = args[:happiness] # жизнерадостность (-10..10)
    @fatigue = args[:fatigue]     # усталость  (0..100)
    @dead = args[:dead]
  end

  def dead?
    @dead
  end
end
