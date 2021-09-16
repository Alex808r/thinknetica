require_relative "wagon"

class CargoWagon < Wagon
  attr_reader :type

  def initialize(number_wagon)
    @type = 'cargo'
    super(number_wagon)
  end
end
