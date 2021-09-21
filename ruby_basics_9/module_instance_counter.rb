# frozen_string_literal: true
# rubocop:disable all



module InstanceCounter
  def self.included(method)
    method.extend ClassMethods
    # method.send :include, InstanceMethods
    method.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances

    def instances
      @instances ||= 0
    end
  end

  module InstanceMethods
    def register_instance
      self.class.instances += 1
    end
  end
end
# rubocop:anable all