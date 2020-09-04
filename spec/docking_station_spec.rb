require 'docking_station'

describe DockingStation do
  let(:bicycle) { Bike.new }

  it { should respond_to :release_bike }

  describe '#release_bike' do
    it 'should release a bike' do
      subject.dock(:bicycle)
      expect(subject.release_bike).to eq :bicycle
    end

    it "should error when there are no bikes available" do
      expect {subject.release_bike}.to raise_error(RuntimeError,"No bike available!")
    end
  end

  it 'should releases a worling bike' do
    subject.dock(:bicycle)
    expect(bicycle.working?).to eq true
  end

  it { should respond_to :dock }

    describe '#dock' do
      it 'should respond to #dock with one argument' do
        expect(subject).to respond_to(:dock).with(1).argument
      end

      it "should error when a bike is already docked" do
        subject.dock(:bicycle)
        expect {subject.dock(:bicycle)}.to raise_error(RuntimeError,"DockingStation full!")
      end
    end


  it { should respond_to :bike }

  it 'should dock a bike' do
    expect(subject.dock(:bicycle)).to eq :bicycle
  end

  it 'should return the docked bike' do
    subject.dock(:bicycle)
    expect(subject.bike).to eq :bicycle
  end

end



# def dock(bike)
#   fail "DockingStation full!" if @bike
#   @bike = bike
# end
