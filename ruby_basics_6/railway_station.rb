# frozen_string_literal: true

require_relative 'module_instance_counter'

class RailwayStation
  include InstanceCounter

  @@all_stations = []

  # или self.all или class << self  end
  def self.all
    @@all_stations
  end

  attr_reader :name, :list_train

  def initialize(name)
    @name = name
    @list_train = []
    @@all_stations.push(self)
    register_instance
  end

  def trains_to_station(&lambda)
    @list_train.each_with_index(&lambda)
  end

  def take_a_train(train)
    @list_train.push(train)
  end

  def train_type_count(type)
    @list_train.count { |train| train.type_of_train.eql?(type) }
    # @list_train.count { |train| train.type_of_train == type  }
  end

  def train_type(type)
    @list_train.select { |train| train.type_of_train == type }
  end

  def send_a_train(train)
    @list_train.delete(train) if @list_train.include?(train)
  end

  private

  # сделаем недоступным изменениe списка поездов на станции из вне
  attr_writer :list_train
end
