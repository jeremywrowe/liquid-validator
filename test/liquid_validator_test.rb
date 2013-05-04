require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/liquid_validator'

describe LiquidValidator::Validator do
  describe "#valid?" do
    it "returns true for valid templates" do
      template = <<-TEMPLATE
        {% if something %}
          HAPPY DAY
        {% endif %}
      TEMPLATE
      LiquidValidator::Validator.new(template).valid?.must_equal true
    end

    it "returns false for invalid templates" do
      template = <<-TEMPLATE
        {% if something
          HAPPY DAY
        {% endif %}
      TEMPLATE
      LiquidValidator::Validator.new(template).valid?.must_equal false
    end
  end

  describe "#errors" do
    it "returns an empty array if the template has no errors" do
      template = <<-TEMPLATE
        {% if something %}
          HAPPY DAY
        {% endif %}
      TEMPLATE
      LiquidValidator::Validator.new(template).errors.must_equal []
    end

    it "returns an an array of the errors in the template" do
      template = <<-TEMPLATE
        {% if something
          HAPPY DAY
        {% endif %}
      TEMPLATE
      LiquidValidator::Validator.new(template).errors.must_equal ["Tag '{%' was not properly terminated with regexp: /\\%\\}/ "]
    end
  end
end

