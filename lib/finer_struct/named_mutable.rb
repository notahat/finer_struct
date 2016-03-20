require 'finer_struct/anonymous_mutable'
require 'finer_struct/named'

module FinerStruct
  def self.Mutable(*attribute_names)
    Named.build_class(Mutable, attribute_names) do
      attribute_names.each do |name|
        define_method(:"#{name}=") {|value| @attributes[name] = value }
      end
    end
  end
end
