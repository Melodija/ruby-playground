require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    bike_available?
    @bike
  end

  def dock bike
    @bike = bike
  end

  private

  def bike_available?
    fail 'There are no bikes in dock!' unless @bike
  end
end
