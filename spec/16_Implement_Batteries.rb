require 'spec_helper'

describe Battery do
  before :each do
    @battery = Battery.new
    @robot = Robot.new
  end
  describe "#new" do
    it "creates a new battery" do
      expect(@battery.name).to eq("Battery")
      expect(@battery.weight).to eq(25)
    end
  end

  describe "#recharge" do
    it "fully restores a robot's shield" do 
      @robot.shield_points = 50
      @robot.wound(70)
      @battery.recharge(@robot)
      expect(@robot.health).to eq(80)
      expect(@robot.shield_points).to eq(50)
    end
  end
end