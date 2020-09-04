require 'docking_station'

describe DockingStation do
  let(:bicycle) { Bike.new }

  it 'should initialize with an empty \"bikes" array' do
    expect(subject.bikes).to eq []

  end

  it { should respond_to :release_bike }

  describe '#release_bike' do
    xit 'should release a bike' do
      subject.dock(:bicycle)
      expect(subject.release_bike).to eq :bicycle
    end

    xit "should error when there are no bikes available" do
      expect {subject.release_bike}.to raise_error(RuntimeError,"No bike available!")
    end
  end

  xit 'should releases a worling bike' do
    subject.dock(:bicycle)
    expect(bicycle.working?).to eq true
  end

  it { should respond_to :dock }

    describe '#dock' do
      it 'should respond to #dock with one argument' do
        expect(subject).to respond_to(:dock).with(1).argument
      end

      xit "should error when a bike is already docked" do
        subject.dock(:bicycle)
        expect {subject.dock(:bicycle)}.to raise_error(RuntimeError,"DockingStation full!")
      end
    end


  it { should respond_to :bikes }

  xit 'should dock a bike' do
    expect(subject.dock(:bicycle)).to eq :bicycle
  end

  xit 'should return the docked bike' do
    subject.dock(:bicycle)
    expect(subject.bikes).to eq :bicycle
  end

end
