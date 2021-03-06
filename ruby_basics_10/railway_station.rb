# frozen_string_literal: true

require_relative 'module_instance_counter'
require_relative 'validation_error'
require_relative 'module_validation'

class RailwayStation
  include InstanceCounter
  include Validation

  @@all_stations = []

  # или self.all или class << self  end
  def self.all
    @@all_stations
  end

  attr_reader :name, :list_train

  validate :name, :presence
  validate :name, :name_length

  def initialize(name)
    @name = name
    @list_train = []
    @@all_stations.push(self)
    register_instance
    validate!
  end

  # def validate!
  #   raise ValidationError, 'Наименование станции не может быть пустым' if @name.empty?
  # end

  def valid?
    validate!
    true
  rescue StandardError
    false
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

#
# statoin = RailwayStation.new("123")
# p statoin.valid?
