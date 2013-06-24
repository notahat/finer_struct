module FinerStruct

  module Named
    def self.build_class(attribute_names, &block)
      Class.new do
        @attribute_names = attribute_names

        class << self
          attr_reader :attribute_names
        end

        def initialize(attributes = {})
          attributes.each_pair do |key, value|
            unless self.class.attribute_names.include?(key)
              raise(ArgumentError, "no such attribute: #{key}")
            end
            instance_variable_set("@#{key}", value)
          end
        end

        instance_eval(&block)
      end
    end
  end

end
