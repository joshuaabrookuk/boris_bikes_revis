require 'bike'

describe Bike do
  it { should respond_to :working? }

  it "should be a working bike" do
    expect(subject.working?(true)).to be true
  end

  describe 'working?' do
    it "should accept an argument of true or false" do
      expect(subject.working?(true)).to eq true
      bike = Bike.new
      expect(bike.working?(false)).to eq false
      #rubocop wont like two expects may have to refactor or run better test
    end
  end
end
