require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity


  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    bike_available?
    bikes.pop
  end

  def dock bike
    dock_full?
    bikes << bike
  end

  private
  attr_reader :bikes

  def bike_available?
    fail 'Bike is either broken or not available.' if empty? || broken?
  end

  def dock_full?
    fail 'Docking station is full.' if full?
  end

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end

  def broken?
     @bikes[0].broken
  end
end
