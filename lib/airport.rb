require_relative 'plane'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    plane.land
  end

  def take_off(plane)
    @hangar.delete(plane)
    plane.take_off
  end

end
