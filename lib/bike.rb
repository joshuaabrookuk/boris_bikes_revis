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
