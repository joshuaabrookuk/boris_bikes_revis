require './spec/support/shared_examples_for_bike_container'

# This is a dummy class used to test the module before using it in our
# established functioning classes
class BikeContainerTest
  include BikeContainer
end

# `it_behaves_like BikeContainer` imports all the tests in the shared example
describe BikeContainerTest do
  it_behaves_like BikeContainer
end
