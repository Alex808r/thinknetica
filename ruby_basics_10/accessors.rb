# frozen_string_literal: true

module Accessors
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def attr_accessor_with_history(*methods)
      methods.each do |method|
        var_name = "@#{method}".to_sym
        # метод геттер
        define_method(method) { instance_variable_get(var_name) }

        define_method("#{method}_history") { instance_variable_get("@#{method}_history") }

        define_method("#{method}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          history = instance_variable_get("@#{method}_history") || []
          instance_variable_set("@#{method}_history", history << value)
        end
      end
    end

    def strong_attr_accessor(method, type)
      define_method(method) { instance_variable_get("@#{method}".to_sym) }

      define_method("#{method}=".to_sym) do |value|
        raise TypeError, "Type should be #{type}" unless value.is_a?(type)

        instance_variable_set("@#{method}", value)
      end
    end
  end
end
