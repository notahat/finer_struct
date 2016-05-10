module FinerStruct
  class Immutable

    def initialize(attributes = {})
      @attributes = attributes.dup.freeze
      freeze
    end

    def method_missing(method, *arguments)
      if has_attribute?(method)
        @attributes[method]
      else
        super
      end
    end

    def respond_to?(method, include_all = false)
      has_attribute?(method) || super
    end

    def to_hash
      @attributes
    end

    def ==(other)
      other.class == self.class && other.to_hash == to_hash
    end

  private

    def has_attribute?(attribute)
      @attributes && @attributes.has_key?(attribute)
    end
  end
end
