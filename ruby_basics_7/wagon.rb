require_relative "module_company"

class Wagon
  include Company
  attr_reader :number_wagon, :type

  def initialize(number_wagon)
    @number_wagon = number_wagon
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected
  def validate!
    raise ValidationError, "Номер вагона не может быть пустым" if @number_wagon.empty?
  end

end
