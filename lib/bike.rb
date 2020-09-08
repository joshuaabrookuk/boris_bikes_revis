class Bike

  attr_reader :status

  def initialize
    @status = true
  end

  def working?
    @status
  end

  def condition(status)
    @status = status
  end

end
