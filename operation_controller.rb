class OperationController

  attr_writer :back_node

  def initialize validate_proc:, action_proc:
    @validate = validate_proc
    @action = action_proc
  end

  def execute inputed_data:
    if @validate.call inputed_data then
      @action.call inputed_data
    end
    @back_node.play
  end
end
