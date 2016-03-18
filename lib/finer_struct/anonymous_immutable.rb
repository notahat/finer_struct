require 'finer_struct/named'

module FinerStruct
  class Immutable
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

    def ==(other)
      other.class == self.class && other.to_hash == to_hash
    end

  end
end
