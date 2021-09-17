require_relative "train"

class PassengerTrain < Train
  def initialize(number)
    super
    @type_of_train = 'passenger'
  end
end
