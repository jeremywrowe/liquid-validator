require 'liquid'
class LiquidValidator
  def initialize(template)
    @template =  template
    @errors   = Array.new
  end

  def valid?
    run_validations_on_template
  end

  def errors
    run_validations_on_template
    @errors
  end

  private
  def run_validations_on_template
    @valid ||= begin
      Liquid::Template.parse(@template).is_a?(Liquid::Template)
    rescue Liquid::SyntaxError => e
      @errors << e
      false
    end
  end
end
