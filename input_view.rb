class InputView

  def initialize petition:, regexp:
    @petition = petition
    @regexp = regexp
  end

  def show
    puts @petition
    return get_input
  end

  protected

  def get_input
    input = gets.chomp
    if @regex =~ input
      return input
    else
      self.show
    end
  end
end
