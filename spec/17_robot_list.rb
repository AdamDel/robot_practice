require 'spec_helper'

describe Robot do
  describe "#new" do
    it "keeps track of the robots created" do
      Robot.clear_robots
      @robot1 = Robot.new
      @robot2 = Robot.new
      @robot3 = Robot.new
      @robot4 = Robot.new

      expect(Robot.robots).to eq([@robot1,@robot2,@robot3,@robot4])
    end
  end
end