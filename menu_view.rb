class MenuView

  attr_accessor :option_nodes, :back_option

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
    selected_option = gets.chomp
    if selected_option < 0 or selected_option > @options.length then
      puts "#{selected_option} is not an option."
      self.show
    else
      return selected_option
    end
  end
end
