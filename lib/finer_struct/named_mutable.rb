require 'finer_struct/anonymous_mutable'
require 'finer_struct/named'

module FinerStruct
  def self.Mutable(*attribute_names)
    Named.build_class(Mutable, attribute_names)
  end
end
