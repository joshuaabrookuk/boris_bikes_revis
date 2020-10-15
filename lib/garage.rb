# frozen_string_literal: true

# The Garage class is a work in progress
class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def fix_all
    @bikes.each do |bike|
      bike.condition(true)
    end
  end
end
