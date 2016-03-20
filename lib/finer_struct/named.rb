module FinerStruct
  module Named

    def initialize(attributes = {})
      unknown_attributes = attributes.keys - attribute_names
      unless unknown_attributes.empty?
        raise(ArgumentError, "unknown attributes: #{unknown_attributes.join(', ')}")
      end

      super
    end

    def self.build_class(superclass, attribute_names, &block)
      Class.new(superclass) do
        include Named

        define_method(:attribute_names, -> { attribute_names })

        attribute_names.each do |name|
          define_method(name) { @attributes[name]  }
        end

        class_eval(&block) if block_given?
      end
    end

  end
end
