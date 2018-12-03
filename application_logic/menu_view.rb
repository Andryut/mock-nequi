class MenuView

  attr_accessor :option_nodes, :back_option

  def initialize
    yield if block_given?
  end

  def show
    print_options
    get_selection
  end

  protected

  def print_options
    @option_nodes.each_with_index do |value, index|
      puts "#{index + 1}) #{value}"
    end
    puts "0) #{back_option}"
  end

  def get_selection
    selected_option = gets.chomp.to_i
    if selected_option < 0 or selected_option > @option_nodes.length then
      puts "#{selected_option} is not an option."
      self.show
    else
      return selected_option
    end
  end
end
