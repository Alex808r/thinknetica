class Train

  attr_accessor :speed
  attr_reader :type_of_train, :current_route

  def initialize(type_of_train, number_of_wagons, train_number)
    @speed = 0
    @train_number = train_number
    if type_of_train == "passenger" || type_of_train == "cargo"
      @type_of_train = type_of_train
    else
      @type_of_train = "Не верный тип поезда"
      abort "Не верный тип поезда"
    end
    @number_of_wagons = number_of_wagons
  end

  def speed_up(speed)
    puts speed > 0 ? @speed += speed : "Скорость не может иметь отрицательное значение"
  end

  def speed_down(speed)
    puts @speed >= speed ? @speed -= speed : "Введеная скорость(#{speed}) больше текущей (#{@speed})"
  end

  def show_list_of_wagons
    puts "Количество вагонов: #{@number_of_wagons}"
  end

  def take_wagon
    puts @speed == 0 ? "Вагон прицеплен. Всего #{@number_of_wagons += 1}" : "Скорость поезда больше 0"
  end

  def drop_wagon
    puts @speed == 0 ? "Вагон отцеплен. Осталось #{@number_of_wagons -= 1}" : "Скорость поезда больше 0"
  end

  def take_route(route)
    @first_station = route.stations.first
    @last_station = route.stations.last
    @current_route = route
    puts "Маршурт #{@first_station.name} - #{@last_station.name}. Всего станций: #{@current_route.stations.size}."
  end

  def go_to_route(station)
    @current_station = station
    puts @current_route.stations.include?(station) ? "Поезд отправляется на станцию #{station.name}." :
           "Такой станции нет на маршруте."

    # puts @current_station = @current_route.stations[@current_route.stations.index(@start_station) + 1].inspect
    # @current_station ||= @start_station
    # puts @current_station = @current_route.stations
  end

  def next_to_route
    @current_station_index = @current_route.stations.index(@current_station)
    @current_station = @current_route.stations[@current_station_index + 1]
    puts "Поезд отправляется на следующую станцию #{@current_station.name}."
    # puts @current_route.stations[@current_route.stations.index(@start_station) - 1].inspect
  end

  def back_to_route
    @current_station_index = @current_route.stations.index(@current_station)
    @current_station = @current_route.stations[@current_station_index - 1]
    puts "Поезд отправляется на предыдущую станцию #{@current_station.name}."
    # puts @current_route.stations[@current_route.stations.index(@start_station) - 1].inspect
  end

  def location
    @current_station ||= @first_station
    puts "Текущая станция: #{@current_station.name}"
    @current_station_index = @current_route.stations.index(@current_station)
    puts "Ближайшие станции: впереди #{@current_route.stations[@current_station_index + 1].name}" \
              " позади: #{@current_route.stations[@current_station_index - 1].name}"
  end

end
