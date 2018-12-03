class GoalMenu < MenuTree

  def build_options_nodes navigation_nodes:
    @list_op = GoalsOperations::ListOP.new navigation_nodes: navigation_nodes
    @create_op = GoalsOperations::CreateOP.new navigation_nodes: navigation_nodes
    @close_op = GoalsOperations::CloseOP.new navigation_nodes: navigation_nodes
    @deposit_op = GoalsOperations::DepositOP.new navigation_nodes: navigation_nodes
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "List all the goals", node: @list_op.operation_node
    menu_builder.add_option text: "Create a goal", node: @create_op.operation_node
    menu_builder.add_option text: "Close a goal", node: @close_op.operation_node
    menu_builder.add_option text: "Deposit money on a goal", node: @deposit_op.operation_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @list_op.setup_back node: @menu_node
    @create_op.setup_back node: @menu_node
    @close_op.setup_back node: @menu_node
    @deposit_op.setup_back node: @menu_node
  end
end
