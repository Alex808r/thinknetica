# frozen_string_literal: true

require_relative 'train'
require_relative 'validation_error'

class PassengerTrain < Train
  def initialize(number)
    super
    @type_of_train = 'passenger'
  end
end
