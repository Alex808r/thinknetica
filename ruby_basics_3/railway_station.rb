class RailwayStation

  attr_reader :name, :list_train

  def initialize(name)
    @name = name
    @list_train = []
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

end
