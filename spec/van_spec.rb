# frozen_string_literal: true

require 'van'

describe Van do
  let(:bike) { double :bike }
  let(:dockingstation) { double :docking_station }
  describe 'initialize' do
    it 'should initialize with an empty "bikes" array' do
      expect(subject.bikes).to eq []
    end
  end

  it { should respond_to :collect_bikes }

  describe '#collect_bikes' do
    it 'should respond to #collect_bikes with one argument' do
      expect(subject).to respond_to(:collect_bikes).with(1).argument
    end

    it 'should collect bikes from the dockingstation' do
      allow(dockingstation).to receive(:bikes).and_return([bike])
      subject.collect_bikes(dockingstation)
      expect(subject.bikes).to eq [bike]
    end

    # it 'should only collect broken bikes from the dockingstation' do
    #   # allow(dockingstation).to receive(:bikes).and_return([bike])
    #   # allow(bike).to receive(:status).and_return(false)
    #   station = DockingStation.new
    #   bike_1 = Bike.new
    #   bike_2 = Bike.new
    #   bike_2.condition(false)
    #   station.dock(bike_1)
    #   station.dock(bike_2)
    #   subject.collect_bikes(station)
    #   expect(subject.bikes[0].status).to eq false
    # end

    it 'should only collect broken bikes from the dockingstation' do
      # allow(dockingstation).to receive(:bikes).and_return([bike])
      # allow(bike).to receive(:status).and_return(false)
      station = DockingStation.new
      bike_1 = Bike.new
      bike_2 = Bike.new
      bike_2.condition(false)
      station.dock(bike_1)
      station.dock(bike_2)
      subject.collect_bikes(station)
      expect(subject.bikes[0].status).to eq false
    end
  end
end
