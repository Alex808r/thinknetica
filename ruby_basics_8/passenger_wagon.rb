# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader :type, :number_of_seats, :occupied_place

  def initialize(number_wagon, number_of_seats)
    @type = 'passenger'
    @number_of_seats = number_of_seats
    @occupied_place = 0
    super(number_wagon)
  end

  def take_the_place
    @occupied_place += 1
  end

  def free_place
    @number_of_seats.to_i - @occupied_place.to_i
  end
end

# wagon = PassengerWagon.new('12','45')
# p wagon.number_of_seats
# p wagon.take_the_place
# p wagon.take_the_place
# p wagon.take_the_place
# p wagon.take_the_place
# p wagon.free_place
