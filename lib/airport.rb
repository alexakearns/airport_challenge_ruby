require_relative 'plane'

class Airport

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 5

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
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
