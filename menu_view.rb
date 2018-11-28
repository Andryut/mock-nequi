class MenuView

  def initialize options:, back_option:
    @options = options
    @back_option = back_option
  end

  def show
    print_options
    get_selection
  end

  protected

  def print_options
    options.each_with_index do |value, index|
      puts "#{index + 1}) #{value}"
    end
    puts "0) #{back_option}"
  end

  def get_selection
    input = gets.chomp
    if input < 0 or input > @options.length then
      puts "#{input} is not an option."
      self.show
    else
      return input
    end
  end
end
