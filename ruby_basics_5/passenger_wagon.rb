require_relative "wagon"

class PassengerWagon < Wagon

  attr_reader :type

  def initialize(number_wagon)
    @type = 'passenger'
    super(number_wagon)
  end

end
