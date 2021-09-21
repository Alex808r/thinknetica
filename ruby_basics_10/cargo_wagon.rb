# frozen_string_literal: true

require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :type, :volume_wagon, :occupied_volume

  def initialize(number_wagon, volume_wagon)
    @type = 'cargo'
    @volume_wagon = volume_wagon
    @occupied_volume = 0
    super(number_wagon)
  end

  def take_up_volume(volume)
    @occupied_volume += volume.to_i
  end

  def available_volume
    @volume_wagon - @occupied_volume
  end
end

# cargo = CargoWagon.new("123",50)
# p cargo.volume_wagon
# p cargo.take_up_volume('10')
# p cargo.take_up_volume('10')
# p cargo.available_volume
