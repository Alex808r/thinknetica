require_relative "railway_station"
require_relative "route"
require_relative "train"

# Станции:
moscow   = RailwayStation.new('Moscow')
kazan    = RailwayStation.new('Kazan')
novgorod = RailwayStation.new('Novgorod')
kirov    = RailwayStation.new('Kirov')

# Поезда:
train_1  = Train.new('passenger', 10)
train_2  = Train.new('cargo', 20)

# Маршруты:
ro = Route.new(kazan, kirov)
ro.add_station(novgorod)
ro.add_station(moscow)


train_1.take_route(ro)
puts train_1.current_station.name


kazan.take_a_train(train_1)
kazan.take_a_train(train_2)
kazan.list_train

kazan.train_type_count('passenger')
kazan.train_type('passenger')
# train_1.location

# train_1.go_to_route(moscow)
# train_1.location

# train_1.next_to_route
# train_1.location
# train_1.back_to_route
# train_1.location

# train_1.speed_up(10)
# train_1.speed_down(11)

# moscow.take_a_train(train_2)
# moscow.take_a_train(train_1)
# moscow.show_train_to_station
# #moscow.show_train_by_type("cargo")
