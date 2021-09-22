module Validation
  def self.included(base)
    base.extend(ClassMethods)
    base.send :include, InstanceMethods
  end

  VALID_NUMBER = /^[\w\d]{3}-?[\w\d]{0,2}/i.freeze

  module ClassMethods
    def validate(*attributes)
      @validations ||= []

      name = attributes[0]
      value = instance_variable_get("@#{name}")

      validator = attributes[1]
      validation = attributes[2]

      @validations << {
        name: name,
        validator: validator,
        validation: validation
      }
    end
  end

  module InstanceMethods
    def validate!
      validations = self.class.instance_variable_get('@validations')
      errors = []

      validations.each do |validation|
        value = instance_variable_get("@#{validation[:name]}")
        error = send(validation[:validator], validation[:name], value, validation[:validation])

        errors << error if error
      end

      raise ValidationError, errors unless errors.empty?

      true
    end

    private

    def type(attr, value, type)
      return "#{attr}: Ожидается тип #{type}" unless value.is_a?(type)
    end

    def presence(attr, value, _validation)
      return { attr: attr, error: 'Не может быть пустым' } if value.nil?
    end

    def format(attr, value, validation)
      return "#{attr}: Не верный формат номера #{VALID_NUMBER}" unless !!value.to_s.match?(validation)
    end

    def name_length(attr, value, _validation)
      return "#{attr}: должен быть как минимум 2 символа" if value.length < 2
    end

    def valid?
      validate!
      true
    rescue ValidationError
      false
    end
  end
end
