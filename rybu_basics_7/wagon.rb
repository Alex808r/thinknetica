require_relative "module_company"

class Wagon
  include Company
  attr_reader :number_wagon, :type

  def initialize(number_wagon)
    @number_wagon = number_wagon
  end

end
