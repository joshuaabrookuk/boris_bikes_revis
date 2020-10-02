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
  end

  # def release_bike
  #   if empty? || !bike_status?
  #     raise "No bike available!"
  #   else
  #     @bikes.pop
  #   end
  # end

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
