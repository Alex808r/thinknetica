class Train

  attr_accessor :speed
  attr_reader :type_of_train, :current_route, :current_station

  def initialize(type_of_train, number_of_wagons)
    @speed = 0
    if type_of_train == "passenger" || type_of_train == "cargo"
      @type_of_train = type_of_train
    else
      abort "Не верный тип поезда"
    end
      @number_of_wagons = number_of_wagons
  end

  def speed_up(speed)
    @speed > 0 ? @speed += speed : "Скорость не может иметь отрицательное значение"
  end

  def speed_down(speed)
    @speed >= speed ? @speed -= speed : "Введеная скорость(#{speed}) больше текущей (#{@speed})"
  end

  def show_list_of_wagons
    "Количество вагонов: #{@number_of_wagons}"
  end

  def take_wagon
    @speed == 0 ? "Вагон прицеплен. Всего #{@number_of_wagons += 1}" : "Скорость поезда больше 0"
  end

  def drop_wagon
    @speed == 0 ? "Вагон отцеплен. Осталось #{@number_of_wagons -= 1}" : "Скорость поезда больше 0"
  end

  def take_route(route)
    @current_route = route
    @current_station = @current_route.stations.first
    @current_route.stations.first.take_a_train(self)
  end

  # def current_station
  #   @current_route.stations.index(@current_station)
  # end

  def move_forward
    @current_station_index = @current_route.stations.index(@current_station)
    @current_station = @current_route.stations[@current_station_index + 1]
  end

  def move_bakward
    @current_station_index = @current_route.stations.index(@current_station)
    @current_station = @current_route.stations[@current_station_index - 1]
  end

  def next_station
    if @current_station == @current_route.stations.last
      @current_route.stations[@current_route.stations.length-2]
    else
      @current_route.stations[@current_route.stations.index(@current_station)+1]
    end
  end

  def previous_station
    if @current_station == @current_route.stations[0]
      @current_route.stations[1]
    else
      @current_route.stations[@current_route.stations.index(@current_station)-1]
    end
  end
end
