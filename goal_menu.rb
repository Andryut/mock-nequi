class GoalMenu < MenuTree

  def build_options_nodes session:
    configured_data = {:session => session}
    @list_op = GoalOperations::ListOP.new configured_data: configured_data
    @create_op = GoalOperations::CreateOP.new configured_data: configured_data
    @close_op = GoalOperations::CloseOP.new configured_data: configured_data
    @deposit_op = GoalOperations::DepositOP.new configured_data: configured_data
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
