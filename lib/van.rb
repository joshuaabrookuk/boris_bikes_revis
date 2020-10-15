# frozen_string_literal: true

# The Van class is a work in progress
class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(location)
    if location.is_a?(DockingStation)
      location.bikes.each do |bike|
        @bikes << bike if bike.status == false
      end
      location.bikes.clear
    elsif location.is_a?(Garage)
      location.bikes.each do |bike|
        @bikes << bike
      end
    end
  end


  def drop_off_bikes(location)
    @bikes.each do |bike|
      location.bikes << bike
    end
    @bikes = []
  end
end
