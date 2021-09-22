# frozen_string_literal: true

require_relative 'railway_station'
require_relative 'route'
require_relative 'train'

# Станции:
kazan    = RailwayStation.new('Kazan')
novgorod = RailwayStation.new('Novgorod')
moscow   = RailwayStation.new('Moscow')
kirov    = RailwayStation.new('Kirov')

# Поезда:
train_1  = Train.new('passenger', 10, '1A')
train_2  = Train.new('cargo', 20, '2B')

# Маршруты:
ro = Route.new(kazan, kirov)

# Добавим 2 промежуточные станции в маршрут
ro.add_station(novgorod)
ro.add_station(moscow)

# Проверим количество станций на маршруте. Должно быть 4.
ro.stations

# Поезд принимает маршурт
train_1.take_route(ro)
train_2.take_route(ro)

# Посмотрим сколько поездов на старции Казань. Должно быть 2.
kazan.list_train

# Узнаем следующую станцию. Должна быть Новгород.
train_1.next_station

# Отправим первый поезд на следующую станцию
train_1.move_forward

# Проверим сколько поездов на станции Казань. Должен быть 1.
kazan.list_train

# Проверим где стоит поезд 1. Должен быть в Новгороде
train_1.current_station
novgorod.list_train

# Проверим где стоит поезд 2. Должен быть на станции Казань.
train_2.current_station

# Проверим предыдущую станцию для поезда 2. Должны получить nil так как поезд на первой станции.
train_2.previous_station

# Отправим поезд 2 на предыдущую станцию. Должны получить nil так как поезд на первой станции.
train_2.move_bakward

# Проверим сколько поездов каждого типа на станции Казань. cargo = 1, passanger = 0
kazan.train_type_count('cargo')
kazan.train_type_count('passenger')

# Проверим наличие пассажироского поезда на станции Новгород.
novgorod.train_type_count('passenger')
novgorod.train_type('passenger')

# Отправим поезд 2 на конечную станцию
train_2.move_forward
train_2.move_forward
train_2.move_forward
train_2.current_station

# Проверим предыдущую и следующую. nil следующая, Moscow предыдущая.
train_2.next_station
train_2.previous_station
