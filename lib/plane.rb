class Plane

  def initialize
    @in_flight = true
  end

  def flying?
    @in_flight
  end

  def land
    @in_flight = false
  end

  def take_off
    @in_flight = true
  end

end