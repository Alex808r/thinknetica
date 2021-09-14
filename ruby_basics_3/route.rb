class Route

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = Array.new
    @stations.push(first_station, last_station)
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station) if @stations.include?(station)
  end

  def station_list
    @stations.each do |station|
      puts station.name
    end
  end

end
