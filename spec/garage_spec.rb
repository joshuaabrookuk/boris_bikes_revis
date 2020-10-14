# frozen_string_literal: true

require 'garage'

describe Garage do
  let(:bike) { double :bike }

  it { should respond_to(:fix) }

  describe '#fix' do
    it 'should fix all bikes in the garage' do
      allow(bike).to receive(:condition).with(false).and_return(false)
      allow(bike).to receive(:status).and_return(true)
      subject.bikes << bike
      subject.fix
      expect(subject.bikes[0].status).to eq true
    end
  end
end
