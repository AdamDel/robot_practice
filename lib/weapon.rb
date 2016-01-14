class Weapon < Item
  attr_accessor :damage
  def initialize(name, weight, damage)
    super("power_shock", 10)
    @damage = damage
  end

  def hit(robot)
    robot.wound(@damage)
  end
  
end
