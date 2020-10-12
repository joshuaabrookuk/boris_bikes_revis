# frozen_string_literal: true

# The Van class is a work in progress

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(station)
    station.bikes.each do |bike|
      if bike.status == false
        @bikes << bike
      end
    end
  end
end
