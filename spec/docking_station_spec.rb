require 'docking_station'

describe DockingStation do
  it { should respond_to :release_bike }

  it "should release a bike" do
    expect (subject.release_bike).should eq (Bike.new)
  end
end
