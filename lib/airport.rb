require_relative 'plane'

class Airport

  attr_reader :hangar, :capacity

  def initialize
    @hangar = []
    @capacity = 5
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
