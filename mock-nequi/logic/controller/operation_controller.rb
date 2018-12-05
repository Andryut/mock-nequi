class OperationController

  attr_writer :back_node, :navigation_nodes, :session, :dynamic

  def initialize action_proc:
    @action = action_proc
  end

  def execute input:
    filled_form = input
    if @dynamic
      @action.call filled_form, @navigation_nodes, @session
    else
      @action.call filled_form, @session
    end
    @back_node.play
  end
  
end
