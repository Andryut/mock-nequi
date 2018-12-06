class InputView < View

  def initialize petition:, field_type:, key:
    @petition = petition
    @field_type = field_type
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
    if InputValidator.is_valid? field_type: @field_type, value: input
      return {@key.to_sym => input}
    else
      self.show
    end
  end
  
end
