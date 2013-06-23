require 'finer_struct/immutable'

module FinerStruct

  class Mutable < Immutable
    def method_missing(method, *arguments)
      if is_assigment?(method) && @attributes.has_key?(key_for_assignment(method))
        @attributes[key_for_assignment(method)] = arguments[0]
      else
        super
      end
    end

  private

    def is_assigment?(method)
      method.to_s.end_with?("=")
    end

    def key_for_assignment(method)
      method.to_s[0..-2].to_sym
    end
  end

  def self.Mutable(*attribute_names)
    Class.new do
      @attribute_names = attribute_names

      class << self
        attr_reader :attribute_names
      end

      attr_accessor(*attribute_names)

      def initialize(attributes = {})
        attributes.each_pair do |key, value|
          unless self.class.attribute_names.include?(key)
            raise(ArgumentError, "no such attribute: #{key}")
          end
          instance_variable_set("@#{key}", value)
        end
      end
    end
  end

end

