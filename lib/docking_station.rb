class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize
    @bikes = []
    @capacity = true
  end

  def release_bike
    raise "No bike available!" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "DockingStation full!" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
