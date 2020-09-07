require 'bike'

describe Bike do
  it { should respond_to :working? }

  it "should be a working bike" do
    expect(subject.working?).to be true
  end
end
