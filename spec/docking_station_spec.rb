# frozen_string_literal: true

require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }

  describe 'initialize' do
    it 'should initialize with an empty \"bikes" array' do
      expect(subject.bikes).to eq []
    end

    it 'should accept one argument' do
      station = DockingStation.new(19)
      expect(station.capacity).to eq 19
    end
  end

  it { should respond_to :release_bike }

  describe '#release_bike' do
    it 'should release a bike' do
      bicycle = Bike.new
      subject.dock(bicycle)
      expect(subject.release_bike).to eq bicycle
    end

    it 'should error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error(RuntimeError, 'No bike available!')
    end

    it 'should releases a working bike' do
      subject.dock(:bike)
      allow(bike).to receive(:working?).and_return(true)
      expect(bike.working?).to eq true
    end

    it 'should not release a broken bike' do
      subject.dock(bike)
      allow(bike).to receive(:status).and_return(false)
      expect {subject.release_bike}.to raise_error(RuntimeError, 'No bike available!')
    end
  end

  it { should respond_to :dock }

  describe '#dock' do
    it 'should respond to #dock with one argument' do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it 'should error when a bike is already docked' do
      subject.capacity.times {subject.dock(:bike)}
      expect {subject.dock double(:bike)}.to raise_error(RuntimeError, 'DockingStation full!')
    end
  end

  it { should respond_to :bikes }

  it 'should dock a bike' do
    expect(subject.dock(:bike)).to eq [:bike]
  end

  it 'should return the docked bike' do
    subject.dock :bike
    expect(subject.bikes).to eq [:bike]
  end

  it 'should have DEFAULT_CAPACITY const ' do
    expect(DockingStation::DEFAULT_CAPACITY).to be
  end

  it 'should have DEFAULT_CAPACITY const at 20 by default' do
    expect(DockingStation::DEFAULT_CAPACITY).to eq 20
  end

  describe '#capacity' do
    it 'should have a capacity atribute' do
      expect(subject.capacity).to be
    end

    it 'should have a capacity atribute set to DEFAULT_CAPACITY on initialize' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
