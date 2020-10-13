# frozen_string_literal: true

# The Van class is a work in progress
class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(station)
    station.bikes.each do |bike|
      @bikes << bike if bike.status == false
    end
  end

  def drop_off_bikes(garage)
    @bikes.each do |bike|
      garage.bikes << bike
    end
  end
end
