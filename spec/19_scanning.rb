require 'spec_helper'

describe Robot do
  before :each do
    @robot1 = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
    @robot4 = Robot.new

  end

  describe "#scanning" do
    it "returns an array of the positions surround robot" do
      @robot2.move_left
      @robot3.move_right
      @robot4.move_up
      positions = @robot1.scanning
      expect(positions).to eq([[@robot2],[@robot3],[@robot4]])
    end  
  end
end