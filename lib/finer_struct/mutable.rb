require 'finer_struct/immutable'
require 'finer_struct/named'

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
    Named.build_class(attribute_names) do
      attr_accessor(*attribute_names)
    end
  end

end

