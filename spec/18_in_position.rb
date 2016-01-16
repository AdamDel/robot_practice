
require 'spec_helper'

describe Robot do
  describe ".in_position" do
    it "returns all the robots in the given position" do
      Robot.clear_robots
      @robot1 = Robot.new
      @robot2 = Robot.new
      @robot3 = Robot.new

      @robot1.move_up
      @robot1.move_right
      expect(Robot.in_position(0,0).size).to eq(2)
      expect(Robot.in_position(1,1).size).to eq(1)
      @robot1.move_left
      @robot1.move_down
      expect(Robot.in_position(0,0).size).to eq(3)
    end
  end
end