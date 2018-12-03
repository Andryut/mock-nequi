class OperationLeaf

  attr_reader :operation_node, :session

  def initialize navigation_nodes:, session:
    self.build_input_views
    self.setup_action
    self.build_operation_node navigation_nodes: navigation_nodes, session: session
  end

  def build_input_views
  end

  def setup_action
  end

  def build_operation_node navigation_nodes:, session:
  end

  def setup_back node:
    @operation_node.controller.back_node = node
  end

end
