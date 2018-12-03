class OperationController

  attr_writer :back_node, :navigation_nodes

  def initialize action_proc:
    @action = action_proc
  end

  def execute input:
    filled_form = input
    @action.call filled_form, @navigation_nodes
    @back_node.play
  end
end
