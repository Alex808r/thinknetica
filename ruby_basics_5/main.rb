require_relative "railway_station"
require_relative "route"
require_relative "train"
require_relative "cargo_wagon"
require_relative "cargo_train"
require_relative "passenger_wagon"
require_relative "passenger_train"
require_relative "wagon"
class Main

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def user_choice
    print_main_menu
    loop do
      puts "*** *** ***"
      print "Введите номер команды =>: "
      user_input = gets.strip
      case user_input
      when '0' then break
      when '1' then create_railway_station
      when '2' then create_train
      when '3' then create_route
      when '4' then change_route
      when '5' then set_route_to_train
      when '6' then join_a_wagon
      when '7' then delete_a_wagon
      when '8' then move_next_station
      when '9' then move_back_station
      when '10' then show_stations_list
      when '11' then show_trains_list
      when '12' then show_trains_list_to_station
      when '13' then show_routes_list
      end
    end
  end

  private

  def print_main_menu
    main_menu = [
      '0 выход из программы',
      '1 Создать станцию',
      '2 Создать поезд',
      '3 Создать маршрут',
      '4 Редактировать маршурт(добавить / удалить станцию)',
      '5 Назначить маршрут поезду',
      '6 Добавить вагон к поезду',
      '7 Отцепить вагон от поезда',
      '8 Переместить поезд по маршруту вперед',
      '9 Переместить поезд по маршруту назад',
      '10 Посмотреть список станций',
      '11 Посмотреть весь список поездов',
      '12 Посмотреть список поездов на станции',
      '13 Посмотреть список маршрутов'
    ]
    main_menu.each { |menu| puts menu }
  end

  def create_railway_station
    print "Введите наименование станции: "
    name = gets.strip.capitalize
    @stations.push(RailwayStation.new(name))
    puts "Создана станция: #{@stations.last.name}"
    @stations.last
  end

  def create_train
    print "Введите номер поезда: "
    number = gets.strip
    print "Введите тип поезда(1 - cargo / 2 - passenger): "
    type = gets.strip
    type == "1" ? @trains.push(CargoTrain.new(number)) : @trains.push(PassengerTrain.new(number))
    puts "Создан поезд #{@trains.last}"
    @trains.last
  end

  def stations_list(stations)
    stations.each_with_index do |station, index|
      puts "Индекс станции: #{index} | Наименование станции: #{station.name}"
    end
  end

  def show_stations_list
    stations_list(@stations)
  end

  def trains_list
    @trains.each_with_index do |train, index|
      puts "Индекс: #{index} | Поезд: #{train}"
        # @trains
    end
  end

  def show_trains_list
    trains_list
  end

  def show_trains_list_to_station
    station = select_station
    puts "На выбранной станции #{station} следующие поезда"
    # Вариант без передачи блока в метод
    # station.list_train.each do |train|
    #   puts "Номер поезда #{train.train_number} тип поезда #{train.type_of_train}"
    # end

    # Вариант с передачей блока в метод trains_to_station
    station.trains_to_station do |train, index|
      puts "Индекс #{index} | Номер #{train.train_number} Тип #{train.type_of_train}"
    end
  end

  def create_route
    if @stations.size >= 2
      "Списко всех станций: #{stations_list(@stations)}"
      print "Введите начальную станцию(индекс): "
      first_station = gets.to_i
      print "Введите конечную станцию(индекс): "
      last_station = gets.to_i
      @routes.push(Route.new(@stations[first_station], @stations[last_station]))
      @routes.last
    else
      puts "У вас должно быть минимум 2 станции, чтобы создать маршрут"
      nil
    end
  end

  def select_route
    @routes.each_with_index do |route, index|
      puts "Индекс маршртуа #{index} | Начальная: #{route.first_station.name} Конечная: #{route.last_station.name}"
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

  def show_routes_list
    puts "Все созданные маршруты"
    @routes.each_with_index do |routes, index|
      puts "Индекс маршрута: #{index} | Начальная: #{routes.first_station.name} Конечная: #{routes.last_station.name}"
    end
  end

  def add_station_to_route(route)
    route.add_station(select_station)
    # puts "Маршрут после изменеия "
    # stations_list(route.stations)
  end

  def delete_station_to_route(route)
    if route.stations.count <= 2
      puts "Маршрут состоит из 2 станций их нельзя удалить"
      nil
    else
      puts "Какую станцию удалить?"
      stations_list(route.stations)
      route.delete_station(route.stations[gets.strip.to_i])
      # puts "Маршрут после изменеия "
      # stations_list(route.stations)
    end
  end

  def select_station
    @stations.each_with_index do |station, index|
      puts "Номер станции #{index} название станции #{station.name}"
    end
    print "Введите номер станции: "
    @stations[gets.strip.to_i]
  end

  def select_train
    @trains.each_with_index do |train, index|
      puts "Индекс поезда #{index} | поезд #{train}"
    end
    print "Введите индекс поезда: "
    @trains[gets.strip.to_i]
  end

  def set_route_to_train
    if @trains.empty? || @routes.empty?
      puts "У вас нет поезда или маршрута"
      nil
    else
      select_train.take_route(select_route)
    end
  end

  def join_a_wagon
    train = select_train
    puts "Введите номер вагона"
    number_wagon = gets.strip
    case train.type_of_train
    when "cargo"     then train.take_wagon(CargoWagon.new(number_wagon))
    when "passenger" then train.take_wagon(PassengerWagon.new(number_wagon))
    end
  end

  def delete_a_wagon
    train = select_train
    if train.wagons.empty?
      puts "У поезда нет вагонов"
      nil
    else
      train.drop_wagon
      puts train.wagons.to_s
    end
  end

  def move_next_station
    select_train.move_forward
  end

  def move_back_station
    select_train.move_bakward
  end
end

Main.new.user_choice