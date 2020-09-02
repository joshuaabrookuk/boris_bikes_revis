require 'docking_station'

describe DockingStation do
  it { should respond_to :release_bike }

  it 'should releases a bike' do
    bike = subject.release_bike
    expect(bike).to be_truthy
  end
end
