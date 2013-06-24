module FinerStruct

  module Named
    def self.build_class(attribute_names, &block)
      Class.new do
        define_method(:attribute_names, -> { attribute_names })

        def initialize(attributes = {})
          attributes.each_pair do |name, value|
            unless attribute_names.include?(name)
              raise(ArgumentError, "no such attribute: #{name}")
            end
            instance_variable_set("@#{name}", value)
          end
        end

        instance_eval(&block)
      end
    end
  end

end
