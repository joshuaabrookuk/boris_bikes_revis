# frozen_string_literal: true

require 'van'
require 'docking_station'
require 'bike'

describe Van do
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
      dockingstation = DockingStation.new
      bike = Bike.new
      dockingstation.dock(bike)
      subject.collect_bikes(dockingstation)
      expect(subject.bikes).to eq [bike]
    end
  end
end
