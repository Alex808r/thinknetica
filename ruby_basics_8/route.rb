require_relative "module_instance_counter"

class Route
  include InstanceCounter

  attr_reader :stations, :first_station, :last_station

  def initialize(first_station, last_station)
    @stations = []
    @first_station = first_station
    @last_station = last_station
    @stations.push(first_station, last_station)
    register_instance
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station) if @stations.include?(station)
  end

  private

  def validate!
    raise "Маршрут должен иметь начальную и конечную станцию" if first_station.empty? || @last_station.empty?
  end
end
