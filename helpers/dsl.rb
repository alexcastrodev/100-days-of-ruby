module Smileable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def smile(attribute_name)
      @smileable ||= {}

      define_method(attribute_name) do
        value = instance_variable_get("@#{attribute_name}")
        "#{value} :)"
      end

      define_method("#{attribute_name}=") do |value|
        instance_variable_set("@#{attribute_name}", value)
      end
    end
  end
end

module DontKnowable
  refine Class do
    def dontknow(attribute_name)
      @sadable ||= {}

      define_method(attribute_name) do
        value = instance_variable_get("@#{attribute_name}")
        "#{value} ¯\_(ツ)_/¯"
      end

      define_method("#{attribute_name}=") do |value|
        instance_variable_set("@#{attribute_name}", value)
      end
    end
  end
end