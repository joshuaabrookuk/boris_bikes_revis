require 'bike'

describe Bike do
  it { should respond_to :working? }

  it "should be a working bike" do
    expect(subject.working?).to be true
  end

  it { should respond_to :condition }

  describe '#conditon' do
    it 'should accept an argument' do
      expect(subject).to respond_to(:condition).with(1).argument
    end
  end

end
