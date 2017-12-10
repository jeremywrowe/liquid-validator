require 'test_helper'
require_relative '../lib/liquid-validator'

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

    it "returns false for a template missing a conditional tag" do
      template = <<-TEMPLATE
        {% if something
          HAPPY DAY
        {% endif %}
      TEMPLATE

      LiquidValidator::Validator.new(template).valid?.must_equal false
    end

    it "returns false for a template missing ending of a template variable" do
      skip "This only applies to liquid v3+" unless Gem.loaded_specs['liquid'].version.release >= Gem::Version.create('3')
      another_template = <<-TEMPLATE
        <p>
          {{name </p><p> {{description }}
        </p>
      TEMPLATE

      LiquidValidator::Validator.new(another_template).valid?.must_equal false
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

      LiquidValidator::Validator.new(template).errors.first
        .must_match(/Tag '{%' was not properly|Liquid syntax error/)
    end
  end
end
