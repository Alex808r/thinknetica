# frozen_string_literal: true

require_relative 'train'
require_relative 'validation_error'

class CargoTrain < Train
  def initialize(number)
    super
    @type_of_train = 'cargo'
  end
end

# p train = CargoTrain.new('12345')
# p train.valid?
