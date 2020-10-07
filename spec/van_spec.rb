require 'van'

describe Van do

  describe 'initialize' do
    it 'should initialize with an empty "bikes" array' do
      expect(subject.bikes).to eq []
    end
  end
end
