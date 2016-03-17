require 'finer_struct/named'
require 'finer_struct/value_object'

module FinerStruct

  class Immutable
    include ValueObject

    def initialize(attributes = {})
      @attributes = attributes.dup.freeze
      freeze
    end

    def method_missing(method, *arguments)
      if @attributes.has_key?(method)
        @attributes[method]
      else
        super
      end
    end

    def respond_to?(method)
      @attributes.has_key?(method) || super
    end

    def to_hash
      @attributes
    end
  end

  def self.Immutable(*attribute_names)
    Named.build_class(Immutable, attribute_names)
  end

end
