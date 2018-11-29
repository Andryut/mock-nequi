class OperationController

  attr_writer :back_node

  def initialize validation_proc:, action_proc:, session:
    @validation = validation_proc
    @action = action_proc
    @session = session
  end

  def execute inputed_data:
    if @validation.call inputed_data, session then
      @action.call inputed_data, session
    end
    @back_node.play
  end
end
