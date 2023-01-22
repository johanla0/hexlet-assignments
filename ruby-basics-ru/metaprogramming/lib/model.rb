# frozen_string_literal: true

# BEGIN
module Model
  def initialize(attrs = {})
    attrs.each_pair { |k, v| send("#{k}=", v) }
  end

  def attributes
    Hash[instance_variables.map { |name| [name[1..].to_sym, instance_variable_get(name)] }]
  end

  module ClassMethods
    def attribute(name, options = {})
      define_method name do
        instance_variable_get "@#{name}"
      end

      define_method "#{name}=" do |value|
        new_value = self.class.coerce(value, options[:type])
        instance_variable_set "@#{name}", new_value
      end
    end

    def coerce(data, type)
      value = data.to_s
      case type
      when :string then value.to_s
      when :integer then value.to_i
      when :boolean then value.to_b
      when :datetime then DateTime.parse(value)
      end
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end

class String
  def to_b
    case self.downcase.strip
    when 'true', 'yes', 'on', 't', '1', 'y', '=='
      return true
    when 'nil', 'null'
      return nil
    else
      return false
    end
  end
end
# END
