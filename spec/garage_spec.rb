# frozen_string_literal: true

require 'garage'

describe Garage do

  it { should respond_to(:fix) }

  describe '#fix' do
    it 'should fix all bikes in the garage' do
      bike = Bike.new
      bike.condition(false)
      subject.bikes << bike
      subject.fix
      expect(subject.bikes[0].status).to eq (true)
    end
  end
end
