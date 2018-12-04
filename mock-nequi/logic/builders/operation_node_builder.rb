class OperationNodeBuilder

  attr_writer :dynamic

  def initialize
    @navigation_nodes = Hash.new
    @input_views = Array.new
    @back_node = nil
    @session = nil
    @dynamic = false
  end

  def initialize input_views: Array.new, action_proc:, navigation_nodes:, session:, dynamic: false, back_node: nil
    @input_views = input_views
    @action_proc = action_proc
    @navigation_nodes = navigation_nodes
    @session = session
    @dynamic = dynamic
    @back_node = back_node
  end

  def add_input view:
    @input_views << view
  end

  def change_session session:
    @session = session
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
