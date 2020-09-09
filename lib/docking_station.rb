class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity= DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  # def release_bike
  #   case
  #   when empty?
  #     raise "No bike available!"
  #   when bike_status? == false
  #     fail "Bike broken!"
  #   else
  #     @bikes.pop
  #   end
  # end

  def release_bike
    raise "No bike available!" if empty?
    @bikes.pop unless bike_status? == false
    # raise "Bike broken!"
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
