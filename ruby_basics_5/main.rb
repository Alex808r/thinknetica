require_relative "railway_station"
require_relative "route"
require_relative "train"
require_relative "cargo_wagon"
require_relative "cargo_train"
require_relative "passenger_wagon"
require_relative "passenger_train"

class Main

  def initialize
    @stations = []
    @trains = []
    @routes = []
    user_choice
  end

  def print_main_menu
    main_menu = [
      '0 выход из программы',
      '1 Создать станцию',
      '2 Создать поезд',
      '3 Создать маршрут',
      '4 Добавить станцию к маршруту',
      '5 Удалить станцию из маршрута',
      '6 Назначить маршрут поезду',
      '7 Добавить вагон к поезду',
      '8 Отцепить вагон от поезда',
      '9 Переместить поезд по маршруту вперед',
      '10 Переместить поезд по маршруту назад',
      '11 Посмотреть список станций на маршруте',
      '12 Посмотреть список поездов на станции']
    main_menu.each { |menu| puts menu }
  end

  def user_choice
    print_main_menu
    loop do
      print "Введите номер команды: "
      user_input = gets.strip
      case user_input
      when '0' then break
      when '1' then create_railway_station
      when '2' then create_train
      when '3' then create_route
      when '4' then change_route
      end
    end
  end

  def create_railway_station
    print 'Введите наименование станции: '
    name = gets.strip.capitalize
    @stations.push(RailwayStation.new(name))
    puts "Создана станция: #{@stations.last.name}"
    @stations.last
  end

  def create_train
    print 'Введите номер поезда: '
    number = gets.strip
    print 'Введите тип поезда(1 - cargo/ 2- passenger): '
    type = gets.strip
    type == '1' ? @trains.push(CargoTrain.new(number)) : @trains.push(PassengerTrain.new(number))
    @trains.last
  end

  def stations_list(stations)
    stations.each_with_index do |station, index|
      puts "Номер станции: #{index} наименование стацнии #{station.name}"
    end
  end

  def create_route
    if @stations.size > 2
      "Списко всех станций: #{stations_list(@stations)}"
      print 'Введите начальную станцию(номер): '
      first_station = gets.to_i
      print 'Введите конечную станцию(номер): '
      last_station = gets.to_i
      @routes.push(Route.new(@stations[first_station], @stations[last_station]))
      @routes.last
    else
      puts 'У вас должно быть минимум 2 станции'
    end
  end

  def select_route
    @routes.each_with_index do |route, index|
      puts "Индекс маршртуа #{index}  Начальная #{route.first_station.name} Конечная #{route.last_station.name}"
    end
    print "Введите индекс маршрута: "
    @routes[gets.strip.to_i]
  end

  def change_route
    route = select_route
    puts "1 - добавить / 2 - удалить"
    user_choice = gets.strip.to_i
    if user_choice == 1
      add_station_to_route(route)
    else
      delete_station_to_route(route)
    end
  end

  def add_station_to_route(route)
    route.add_station(select_station)
  end

  def delete_station_to_route(route)
    if route.stations.count <= 2
      puts "Нельзя удалить начальную или конечную"
      nil
    else
      puts "Какую станцию удалить?"
      stations_list(route.stations)
      route.delete_station(route.stations[gets.strip.to_i])
    end

  end

  def select_station
    puts 'Выберите номер станции: '
    @stations.each_with_index do |station, index|
      puts "Номер станции #{index} название станции #{station.name}"
    end
    @stations[gets.strip.to_i]
  end


end

a = Main.new