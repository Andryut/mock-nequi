class MenuController

  attr_accessor :option_nodes, :back_option

  def initialize
    yield if block_given?
  end

  def execute input:
    selected_option = input
    if selected_option == 0 then
      go_back
    else
      go_forward option: selected_option
    end
  end

  protected

  def go_back
    unless back_option.nil?
      back_option.play
    end
  end

  def go_forward option:
    @option_nodes[option - 1].play
  end
  
end
