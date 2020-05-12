require_relative 'plane'

class Airport

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 5

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    if @hangar.count == @capacity 
      raise "airport is full"
    else
      @hangar << plane
      plane.land
    end
  end

  def take_off(plane)
    @hangar.delete(plane)
    plane.take_off
  end

  def change_capacity(num)
    @capacity = num
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end
end
