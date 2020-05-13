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
    puts is_stormy?
    if is_stormy? == false
      if in_hangar?(plane) == true
        @hangar.delete(plane)
        plane.take_off
      else
        raise "plane not in hangar"
      end
    else
      raise "cannot take off due to stormy weather"
    end
  end

  def change_capacity(num)
    @capacity = num
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end

  def is_stormy?
    rand < 0.3
  end

end
