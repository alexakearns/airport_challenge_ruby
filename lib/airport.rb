require_relative 'plane'

class Airport

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 5

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    landing_checks(plane)
    @hangar << plane
    plane.land
  end
    
  def take_off(plane)
    if stormy? == false
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
    if hangar.length > num
      raise "more planes in hangar than new capacity, have some take off first"
    else
      @capacity = num
    end
  end
  
  private

  def landing_checks(plane)
    raise "airport is full" if @hangar.count == capacity
    raise "this plane is already in the hangar" if in_hangar?(plane)
    raise "cannot land due to stormy weather" if stormy?
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end
  
  def stormy?
    rand < 0.3
  end

end
