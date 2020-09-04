class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    if @bikes
      @bikes
    else
      raise "No bike available!"
    end
  end

  def dock(bike)
    if @bikes
      raise "DockingStation full!"
    else
      @bikes = bike
    end
  end

end
