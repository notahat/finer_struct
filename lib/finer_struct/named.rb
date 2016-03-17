module FinerStruct

  module Named

    def initialize(attributes = {})
      unknown_attributes = attributes.keys - attribute_names
      unless unknown_attributes.empty?
        raise(ArgumentError, "unknown attributes: #{unknown_attributes.join(', ')}")
      end

      nil_attributes = Hash[attribute_names.zip()]
      super(nil_attributes.merge!(attributes))
    end

    def self.build_class(superclass, attribute_names)
      Class.new(superclass) do
        define_method(:attribute_names, -> { attribute_names })

        include Named
      end
    end
  end

end
