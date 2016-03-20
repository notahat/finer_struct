require 'finer_struct/anonymous_immutable'
require 'finer_struct/named'

module FinerStruct
  def self.Immutable(*attribute_names)
    Named.build_class(Immutable, attribute_names)
  end
end
