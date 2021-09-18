require_relative "train"

class CargoTrain < Train
  def initialize(number)
    super
    @type_of_train = 'cargo'
  end
end
