class MenuController

  attr_accessor :option_nodes, :back_option

  def execute inputed_data:
    if inputed_data == 0 then
      go_back
    else
      go_forward option: operation_data
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
