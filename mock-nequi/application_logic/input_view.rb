class InputView < View

  def initialize petition:, validation_method_name:, key:
    @petition = petition
    @validation_method_name = validation_method_name
    @key = key
  end

  def show
    clean_screen
    puts @petition
    return get_input
  end

  protected

  def get_input
    input = gets.chomp
    if UIValidator.is_a_valid @validation_method_name, input
      return {@key.to_sym => input}
    else
      self.show
    end
  end
end
