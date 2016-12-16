require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    Bike.new
  end

  def dock bike
    @bike = bike
  end

  # private
  #
  # def bike_docked?
  # end
end
