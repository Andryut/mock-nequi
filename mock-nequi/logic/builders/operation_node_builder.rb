class OperationNodeBuilder

  def initialize
    @navigation_nodes = Hash.new
    @input_views = Array.new
    @back_node = nil
    @session = nil
    @dynamic = false
  end

  def set_dynamic
    @dynamic = true
  end

  def add_input view:
    @input_views << view
  end

  def add_model nodes:
    @navigation_nodes.merge!(nodes)
  end

  def add_session session:
    @session = session
  end

  def with_action proc:
    @action_proc = proc
  end

  def with_back node:
    @back_node = node
  end

  def build
    view = OperationView.new input_views: @input_views
    controller = OperationController.new action_proc: @action_proc
    controller.navigation_nodes = @navigation_nodes
    controller.session = @session
    controller.dynamic = @dynamic
    controller.back_node = @back_node
    return NavigationNode.new view: view, controller: controller
  end
end
