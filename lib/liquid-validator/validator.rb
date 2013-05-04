class LiquidValidator::Validator
  def initialize(template)
    @template = template
    @errors   = []
    @is_valid = false
    run_validations_on_template
  end

  def valid?; @is_valid; end
  def errors; @errors;   end

  private
  def run_validations_on_template
    begin
      ::Liquid::Template.parse(@template)
      @is_valid = true
    rescue Exception => e
      @errors << e.message
    end
  end
end
