class OperationController

  attr_writer :back_node, :model

  def initialize action_proc:
    @action = action_proc
  end

  def execute filled_form:
    @action.call filled_form, @model
    @back_node.play
  end
end
