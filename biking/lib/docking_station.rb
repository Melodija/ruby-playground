require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bikes = []
  end

  def release_bike
    bike_available?
    @bikes.pop
  end

  def dock bike
    dock_full?
    @bikes << bike
  end

  private

  def bike_available?
    fail 'There are no bikes in dock!' if @bikes.empty?
  end

  def dock_full?
    fail 'Docking station is full.' if @bikes.count >= 20
  end
end
