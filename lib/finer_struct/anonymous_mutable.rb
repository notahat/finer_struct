module FinerStruct
  class Mutable

    def initialize(attributes)
      @attributes = attributes.dup
    end

    def method_missing(method, *arguments)
      if has_attribute?(method)
        @attributes[method]
      elsif is_assigment?(method) && has_attribute?(key_for_assignment(method))
        @attributes[key_for_assignment(method)] = arguments[0]
      else
        super
      end
    end

    def respond_to?(method)
      has_attribute?(method) || super
    end

    def to_hash
      @attributes.dup
    end

    def ==(other)
      other.class == self.class && other.to_hash == to_hash
    end

  private

    def is_assigment?(method)
      method.to_s.end_with?("=")
    end

    def key_for_assignment(method)
      method.to_s[0..-2].to_sym
    end

    def has_attribute?(attribute)
      @attributes && @attributes.has_key?(attribute)
    end
  end
end

