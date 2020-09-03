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
    @bike = bike
  end

end
