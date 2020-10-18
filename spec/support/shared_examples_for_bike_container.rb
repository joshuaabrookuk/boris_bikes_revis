require 'bike_container'

shared_examples_for BikeContainer do
  it 'has a empty bikes attribute when initialized' do
    expect(subject.bikes).to eq []
  end
end
