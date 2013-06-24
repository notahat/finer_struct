require 'finer_struct/named'

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
    Named.build_class(attribute_names) do
      attr_reader(*attribute_names)
    end
  end

end
