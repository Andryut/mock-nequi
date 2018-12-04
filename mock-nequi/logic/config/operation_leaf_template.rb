class OperationLeaf

  attr_reader :operation_node, :session

  def initialize navigation_nodes:, session:
    self.build_input_views
    self.setup_action
    self.build_operation_node navigation_nodes: navigation_nodes, session: session
  end

  def build_input_views
    @input_views = Array.new
  end

  def setup_action
    @action_proc = Proc.new do |inputed_data, session|

    end
  end

  def build_operation_node navigation_nodes:, session:
    operation_node_builder = OperationNodeBuilder.new(input_views: @input_views, action_proc: @action_proc, 
      navigation_nodes: navigation_nodes, session: session)
    @operation_node = operation_node_builder.build
  end

  def setup_back node:
    @operation_node.controller.back_node = node
  end

end
