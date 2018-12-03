class InputView

  def initialize petition:, regexp:, key:
    @petition = petition
    @regexp = regexp
    @key = key
  end

  def show
    puts @petition
    return get_input
  end

  protected

  def get_input
    input = gets.chomp
    if input =~ @regexp
      return {@key.to_sym => input}
    else
      self.show
    end
  end
end
