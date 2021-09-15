class Train

  attr_accessor :speed
  attr_reader :type_of_train, :current_route, :current_station, :number_of_wagons, :train_number

  def initialize(type_of_train, number_of_wagons, train_number)
    @speed = 0
    @train_number = train_number
    if type_of_train == "passenger" || type_of_train == "cargo"
      @type_of_train = type_of_train
    else
      abort "Не верный тип поезда"
    end
      @number_of_wagons = number_of_wagons
  end

  def speed_up(speed)
    @speed += speed if @speed > 0
  end

  def speed_stop
    @speed = 0
  end

  def take_wagon
    @number_of_wagons += 1 if @speed == 0
  end

  def drop_wagon
    @number_of_wagons -= 1 if @speed == 0
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
        @current_route.stations[@current_route.stations.index(@current_station)+1]
    end
  end

  def previous_station
    if @current_station != @current_route.stations[0]
      @current_route.stations[@current_route.stations.index(@current_station)-1]
    end
  end
end
