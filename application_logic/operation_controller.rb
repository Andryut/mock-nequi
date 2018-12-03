class OperationController

  attr_writer :back_node, :model_objects

  def initialize action_proc:
    @action = action_proc
  end

  def execute input:
    filled_form = input
    @action.call filled_form, @model_objects
    @back_node.play
  end
end
