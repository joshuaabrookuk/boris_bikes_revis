# frozen_string_literal: true

require 'garage'

describe Garage do
  let(:bike) { double :bike }
  let(:van) { double :van }
  let(:dockingstation) { double :docking_station }

  it { should respond_to(:fix) }

  describe '#fix' do
    it 'should fix all bikes in the garage' do
      allow(bike).to receive(:condition).with(false).and_return(false)
      allow(dockingstation).to receive(:dock).with(bike).and_return(bike)
      allow(van).to receive(:collect_bikes).with(dockingstation).and_return(bike)
      allow(van).to receive(:drop_off_bikes).with(subject).and_return(bike)
      allow(subject).to receive(:bikes).and_return([bike])
      allow(subject).to receive(:fix).and_return([bike])
      allow(bike).to receive(:status).and_return(true)
      expect(subject.bikes[0].status).to eq true
    end
  end
end
