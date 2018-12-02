class OperationController

  attr_writer :back_node, :model_objects

  def initialize action_proc:
    @action = action_proc
    yield if block_given?
  end

  def execute filled_form:
    @action.call filled_form, @model_objects
    @back_node.play
  end
end
