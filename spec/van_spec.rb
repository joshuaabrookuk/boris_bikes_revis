# frozen_string_literal: true

require 'van'

describe Van do
  let(:bike) { double :bike }
  let(:dockingstation) { double :docking_station }
  let(:garage) { double :garage }
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

    it 'should collect broken bikes from the dockingstation' do
      allow(bike).to receive(:condition).with(false).and_return(false)
      allow(dockingstation).to receive(:dock).with(bike).and_return(bike)
      bike2 = Bike.new
      allow(dockingstation).to receive(:dock).with(bike2).and_return(bike2)
      allow(dockingstation).to receive(:bikes).and_return([bike])
      allow(bike).to receive(:status).and_return(false)
      subject.collect_bikes(dockingstation)
      allow(subject).to receive(:bikes).and_return([bike])
      expect(subject.bikes).to eq [bike]
    end

    it 'should only collect broken bikes from the dockingstation' do
      allow(bike).to receive(:condition).with(false).and_return(false)
      allow(dockingstation).to receive(:dock).with(bike).and_return(bike)
      allow(dockingstation).to receive(:bikes).and_return([bike])
      allow(bike).to receive(:status).and_return(false)
      subject.collect_bikes(dockingstation)
      allow(subject).to receive(:bikes).and_return([bike])
      expect(subject.bikes[0].status).to eq false
    end

    it 'should also collect working bikes from the garage' do
      bike = Bike.new
      station = DockingStation.new
      van = Van.new
      garage = Garage.new
      bike.condition(false)
      station.dock(bike)
      subject.collect_bikes(station)
      subject.drop_off_bikes(garage)
      garage.fix_all
      subject.collect_bikes(garage)
      expect(subject.bikes).to eq [bike]
    end
  end

  it { should respond_to(:drop_off_bikes).with(1).arguments }

  describe '#drop_off_bikes' do
    it 'should drop the bikes at a garage' do
      allow(bike).to receive(:condition).with(false).and_return(false)
      allow(dockingstation).to receive(:dock).with(bike).and_return(bike)
      allow(subject).to receive(:collect_bikes).with(dockingstation).and_return(bike)
      allow(subject).to receive(:drop_off_bikes).with(garage).and_return(bike)
      allow(garage).to receive(:bikes).and_return([bike])
      expect(garage.bikes).to eq [bike]
    end
  end
end
