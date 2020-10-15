# frozen_string_literal: true

# The Van class is a work in progress
class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(location)
    case location
    when DockingStation
      pull_bikes if bike.status == false
      location.bikes.clear
    when Garage
      pull_bikes
    end
  end

  def drop_off_bikes(location)
    @bikes.each do |bike|
      location.bikes << bike
    end
    @bikes = []
  end

  private

  def pull_bikes
    location.bikes.each do |bike|
      @bikes << bike
    end
  end
end
