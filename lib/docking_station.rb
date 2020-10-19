# frozen_string_literal: true

require_relative 'bike'
require_relative 'bike_container'

# The DockingStation class holds Bike objects and has a maximum capacity of 20
# It also knows not to release a broken bike
class DockingStation
  include BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    # @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bike available!' if empty? || !bike_status?

    @bikes.pop if bike_status?
  end

  def dock(bike)
    raise 'DockingStation full!' if full?

    @bikes << bike
  end

  private

  def bike_status?
    @bikes[-1].status
  end

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end
end
