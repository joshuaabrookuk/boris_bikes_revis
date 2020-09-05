class DockingStation
  DEFAULT_CAPACITY = true
  attr_reader :bikes

  def initialize
    @bikes = []
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
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end

end
