class OperationController

  attr_writer :back_node

  def initialize validation_proc:, action_proc:
    @validation = validation_proc
    @action = action_proc
  end

  def execute inputed_data:
    if @validation.call inputed_data then
      @action.call inputed_data
    end
    @back_node.play
  end
end
