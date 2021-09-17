require_relative "railway_station"
require_relative "route"
require_relative "train"
require_relative "cargo_wagon"
require_relative "cargo_train"
require_relative "passenger_wagon"
require_relative "passenger_train"
require_relative "module_instance_counter"


# Станции:
kazan    = RailwayStation.new('Kazan')
novgorod = RailwayStation.new('Novgorod')
moscow   = RailwayStation.new('Moscow')
kirov    = RailwayStation.new('Kirov')

RailwayStation.all
RailwayStation.instances

# Поезда:
train_1  = PassengerTrain.new('1A' )
train_2  = CargoTrain.new('2B')
Train.find('1A')

Train.instances
PassengerTrain.instances
CargoTrain.instances

# train_1.company_name = "name"
# train_1.set_company_name = 'name'
# train_1.get_company_name

# Вагоны
passenger_1 = PassengerWagon.new(11)
passenger_2 = PassengerWagon.new(22)
cargo_1 = CargoWagon.new(33)
cargo_2 = CargoWagon.new(44)

# Маршруты:
ro = Route.new(kazan, kirov)
Route.instances

# Добавим 2 промежуточные станции в маршрут:
# ro.add_station(novgorod)
# ro.add_station(moscow)
#
# Проверим количество станций на маршруте. Должно быть 4.
# ro.stations
#
# # Поезд принимает маршурт
# train_1.take_route(ro)
# train_2.take_route(ro)
#
# # Посмотрим сколько поездов на старции Казань. Должно быть 2.
# kazan.list_train
#
# Добавим вагоны при текущей скорости 10
# train_1.speed_up(10)
# train_1.speed
# train_1.take_wagon(passenger_1)   # тут получим nil так как у поезда скорость > 0
# train_1.speed_stop
# train_1.take_wagon(cargo_1)       # тут получим nil так как вагон не того типа
# train_1.take_wagon(passenger_1)
# train_1.take_wagon(passenger_2)
# train_1.wagons.count                    # получим 2 так как 2 вагона добавлены к поезду
# train_1.drop_wagon
# train_1.wagons
# Узнаем следующую станцию. Должна быть Новгород.
# train_1.next_station.name
#
# # Отправим первый поезд на следующую станцию
# train_1.move_forward
#
# # Проверим сколько поездов на станции Казань. Должен быть 1.
# kazan.list_train
#
# # Проверим где стоит поезд 1. Должен быть в Новгороде
# train_1.current_station
# novgorod.list_train
#
# # Проверим где стоит поезд 2. Должен быть на станции Казань.
# train_2.current_station
#
# # Проверим предыдущую станцию для поезда 2. Должны получить nil так как поезд на первой станции.
# train_2.previous_station
#
# # Отправим поезд 2 на предыдущую станцию. Должны получить nil так как поезд на первой станции.
# train_2.move_bakward
#
# Проверим сколько поездов каждого типа на станции Казань. cargo = 1, passanger = 0
# kazan.train_type_count('cargo')
# kazan.train_type_count('passenger')
#
# # Проверим наличие пассажироского поезда на станции Новгород.
# novgorod.train_type_count('passenger')
# novgorod.train_type('passenger')
#
# # Отправим поезд 2 на конечную станцию
# train_2.move_forward
# train_2.move_forward
# train_2.move_forward
# train_2.current_station
#
# # Проверим предыдущую и следующую. nil следующая, Moscow предыдущая.
# train_2.next_station
# train_2.previous_station