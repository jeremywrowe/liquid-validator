class LiquidValidator::Validator
  attr_reader :errors, :template, :error_mode

  def initialize(template, error_mode: :strict)
    @template = template
    @error_mode = error_mode
    @errors = []
    @valid = true
    run_validations_on_template
  end

  def valid?
    @valid
  end

  private

  def run_validations_on_template
    if Gem.loaded_specs['liquid'].version.release >= Gem::Version.create('3')
      ::Liquid::Template.parse(template, error_mode: :strict)
    else
      ::Liquid::Template.parse(template)
    end
  rescue Liquid::SyntaxError => e
    @valid = false
    @errors << e.message
  end
end
