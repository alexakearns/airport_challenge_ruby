require_relative 'plane'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    plane
  end

  def take_off(plane)
    plane
  end

  def store(plane)
    @hangar << plane
  end

end
