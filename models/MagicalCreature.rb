class MagicalCreature
  attr_accessor :name, :magical_ability, :age
  
  def initialize(name, magical_ability, age = nil)
    @name = name
    @magical_ability = magical_ability
    @age = age
  end

  def ancient?
    age > 200 || age == nil
  end
end
