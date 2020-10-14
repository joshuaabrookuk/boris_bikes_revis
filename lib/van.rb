# frozen_string_literal: true

# The Van class is a work in progress
class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(location)
    location.bikes.each do |bike|
      @bikes << bike if bike.status == false
    end
  end

  def drop_off_bikes(location)
    @bikes.each do |bike|
      location.bikes << bike
    end
    @bikes = []
  end
end
