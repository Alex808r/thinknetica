class RailwayStation

  attr_reader :name, :list_train

  def initialize(name)
    @name = name
    @list_train = []
  end

  def trains_to_station(&lambda)
    @list_train.each_with_index(&lambda)
  end

  def take_a_train(train)
    @list_train.push(train)
  end

  def train_type_count(type)
    @list_train.count { |train| train.type_of_train.eql?(type)  }
    #@list_train.count { |train| train.type_of_train == type  }
  end

  def train_type(type)
    @list_train.select{|train| train.type_of_train == type}
  end

  def send_a_train(train)
    @list_train.delete(train) if @list_train.include?(train)
  end

  private
  # сделаем недоступным изменениe списка поездов на станции из вне
  attr_writer :list_train

end
