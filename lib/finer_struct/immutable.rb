module FinerStruct

  class Immutable
    def initialize(attributes = {})
      @attributes = attributes.dup
    end

    def method_missing(method, *arguments)
      if @attributes.has_key?(method)
        @attributes[method]
      else
        super
      end
    end
  end

  def self.Immutable(*attribute_names)
    Class.new do
      @attribute_names = attribute_names

      class << self
        attr_reader :attribute_names
      end

      attr_reader(*attribute_names)

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
