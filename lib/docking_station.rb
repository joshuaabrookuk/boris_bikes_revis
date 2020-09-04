class DockingStation
  attr_reader :bike

  def release_bike
    if @bike
      @bike
    else
      raise "No bike available!"
    end
  end

  def dock(bike)
    if @bike
      raise "DockingStation full!"
    else
      @bike = bike
    end
  end

end
