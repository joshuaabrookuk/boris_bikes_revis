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
  end
end
