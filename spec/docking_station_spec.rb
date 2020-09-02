require 'docking_station'

describe DockingStation do
  it { should respond_to :release_bike }

  it 'should releases a bike' do
    bike = subject.release_bike
    expect(bike).to be
  end

  it 'should releases a worling bike' do
    bike = subject.release_bike
    expect(bike.working?).to eq true
  end
end
