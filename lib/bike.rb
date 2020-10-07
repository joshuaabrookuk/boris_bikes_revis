# frozen_string_literal: true

# The Bike class is mostly a static object but It remembers it's status
class Bike
  attr_reader :status

  def initialize
    @status = true
  end

  def condition(status)
    @status = status
  end

  def working?
    @status
  end
end
