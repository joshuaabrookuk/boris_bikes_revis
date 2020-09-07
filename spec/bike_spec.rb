require 'bike'

describe Bike do
  it { should respond_to :working? }

  it "should be a working bike" do
    expect(subject.working?).to be true
  end

  describe 'working?' do
    it "should accept an argument of true or false" do
      subject
      expect(subject.working?(true)).to be true
    end
  end
end
