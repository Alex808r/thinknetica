# frozen_string_literal: true

class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = []
    @stations.push(first_station, last_station)
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station) if @stations.include?(station)
  end
end
