class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity= DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bike available!" if empty? || !bike_status?
    
    @bikes.pop unless !bike_status?
    # There must be a better way to write this.
    # raise error if this is true or if this is false
  end

  def dock(bike)
    raise "DockingStation full!" if full?
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
