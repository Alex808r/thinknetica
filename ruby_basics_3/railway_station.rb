class RailwayStation

  attr_reader :name, :list_train

  def initialize(name)
    @name = name
    @list_train = Array.new
  end

  def take_a_train(train)
    @list_train.push(train)
  end

  def show_train_to_station
    puts @list_train
  end

  def show_train_by_type(type)
    number_by_type = 0
    puts "Всего поездов на станции '#{self.name}' : #{@list_train.count}"
    @list_train.each { |train| number_by_type +=1 if train.type_of_train.eql?(type)  }
    puts "Количество поездов типа '#{type}' : #{number_by_type}"
  end

  def send_a_train(train)
    @list_train.delete(train) if @list_train.include?(train)
  end

end
