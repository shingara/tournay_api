require 'models/spec_helper'

describe Color do

  describe "#mongoize" do
    it 'return a Integer' do
      Color.new(1).mongoize.should == 1
    end
  end

  describe ".mongoize" do
    it 'return a Color object' do
      Color.mongoize(1).should == Color.new(1)
    end
  end

  describe ".demongoize" do
    it 'return a Color object' do
      Color.demongoize(1).should == Color.new(1)
    end
  end

  describe ".evolve" do
    it 'return a Color object' do
      Color.evolve(Color.new(1)).should == 1
    end
  end

end
