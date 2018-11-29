class OperationNodeBuilder

  def initialize session:
    @session = session
    @input_views = Array.new
  end

  def add_input view:
    @input_views << view
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
    view = OperationView.new input_views: @input_views
    controller = OperationController.new validation_proc: @validation_proc, action_proc: @action_proc, session: session
    controller.back_node = @back_node
    return NavigationNode.new view: view, controller: controller
  end
end
