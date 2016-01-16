require_relative 'spec_helper'
describe Robot do
  before :each do
    @robot = Robot.new
  end

   describe "#wound" do
    it "decreases health" do
      @robot.shield_points = 50
      @robot.wound(20)
      
      expect(@robot.health).to eq(100)
    end

  end

end