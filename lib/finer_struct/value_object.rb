module FinerStruct
  module ValueObject
    def ==(another_object)
      self.class == another_object.class &&
        self.instance_variables.all? do |ivar|
          self.instance_variable_get(ivar) == another_object.instance_variable_get(ivar)
      end
    end
  end
end
