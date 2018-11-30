class OperationNodeBuilder

  def initialize
    @configured_data = Hash.new
    @input_nodes = Array.new
    @back_node = nil
  end

  def add_input node:
    @input_nodes << node
  end

  def add_configured data:
    @configured_data.merge!(data)
  end

  def with_validation proc:
    @validation_proc = proc
  end

  def with_action proc:
    @action_proc = proc
  end

  def with_back node:
    @back_node = node
  end

  def buid
    view = OperationView.new input_nodes: @input_nodes
    controller = OperationController.new validation_proc: @validation_proc, action_proc: @action_proc
    controller.configured_data = @configured_data
    controller.back_node = @back_node
    return NavigationNode.new view: view, controller: controller
  end
end
