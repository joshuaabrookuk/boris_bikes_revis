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

  it { should respond_to :dock }

  it "should respond to 'dock' with one argument" do
    expect(subject).to respond_to(:dock).with(1).argument
  end
end
