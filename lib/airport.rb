require_relative 'plane'
require_relative 'weather'

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
    take_off_checks(plane)
    @hangar.delete(plane)
    plane.take_off
  end
  
  def change_capacity(num)
    raise "more planes in hangar than new capacity, have some take off first" if hangar.length > num
    
    @capacity = num
  end
  
  private

  def landing_checks(plane)
    raise "airport is full" if @hangar.count == capacity
    raise "this plane is already in the hangar" if in_hangar?(plane)
    raise "cannot land due to stormy weather" if stormy?
  end
  
  def take_off_checks(plane)
    raise "plane not in hangar" unless in_hangar?(plane)
    raise "cannot take off due to stormy weather" if stormy?
  end
  
  def in_hangar?(plane)
    @hangar.include?(plane)
  end
end
