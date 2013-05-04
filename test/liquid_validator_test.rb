require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/liquid_validator'

describe LiquidValidator do
  describe "#valid?" do
    it "returns true for valid templates" do
      template = <<-TEMPLATE
        {% if something %}
          HAPPY DAY
        {% endif %}
      TEMPLATE
      LiquidValidator.new(template).valid?.must_equal true
    end

    it "returns false for invalid templates" do
      template = <<-TEMPLATE
        {% if something
          HAPPY DAY
        {% endif %}
      TEMPLATE
      LiquidValidator.new(template).valid?.must_equal false
    end
  end

  describe "#errors" do
    it "returns an empty array if the template has no errors" do
      template = <<-TEMPLATE
        {% if something %}
          HAPPY DAY
        {% endif %}
      TEMPLATE
      LiquidValidator.new(template).errors.must_equal []
    end

    it "returns an an array of the errors in the template" do
      template = <<-TEMPLATE
        {% if something
          HAPPY DAY
        {% endif %}
      TEMPLATE
      LiquidValidator.new(template).errors.map(&:class).must_equal [Liquid::SyntaxError]
    end
  end
end

