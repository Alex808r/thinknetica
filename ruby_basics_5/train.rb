# frozen_string_literal: true

class Train
  attr_reader :type_of_train, :current_route, :current_station, :wagons, :train_number, :speed

  def initialize(train_number)
    @speed = 0
    @wagons = []
    @train_number = train_number
  end

  def speed_up(speed)
    @speed += speed if speed.positive?
  end

  def speed_stop
    @speed = 0
  end

  def take_wagon(wagon)
    # @wagons.push(wagon) if wagon.type == @type_of_train && @speed == 0
    @wagons.push(wagon) if wagon.type == @type_of_train && speed.zero?
  end

  def drop_wagon
    # @wagons.pop if @speed == 0 или
    @wagons.pop if speed.zero?
  end

  def take_route(route)
    @current_route = route
    @current_station = @current_route.stations.first
    @current_station.take_a_train(self)
  end

  def move_forward
    return unless next_station

    @current_station.send_a_train(self)
    @current_station = next_station
    @current_station.take_a_train(self)
  end

  def move_bakward
    return unless previous_station

    @current_station.send_a_train(self)
    @current_station = previous_station
    @current_station.take_a_train(self)
  end

  def next_station
    if @current_route.stations.index(@current_station) != @current_route.stations.last
      @current_route.stations[@current_route.stations.index(@current_station) + 1]
    end
  end

  def previous_station
    if @current_station != @current_route.stations[0]
      @current_route.stations[@current_route.stations.index(@current_station) - 1]
    end
  end

  private

  # сделаем недоступным изменения скорости и количества вагонов
  attr_writer :speed, :wagons

  # def speed_zero?
  #   self.speed.zero?
  # end
end
