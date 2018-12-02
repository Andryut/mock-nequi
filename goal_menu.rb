class GoalMenu < MenuTree

  def build_options_nodes model_objects:
    @list_op = GoalOperations::ListOP.new model_objects: model_objects
    @create_op = GoalOperations::CreateOP.new model_objects: model_objects
    @close_op = GoalOperations::CloseOP.new model_objects: model_objects
    @deposit_op = GoalOperations::DepositOP.new model_objects: model_objects
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new do
      add_option text: "List all the goals", node: @list_op.operation_node
      add_option text: "Create a goal", node: @create_op.operation_node
      add_option text: "Close a goal", node: @close_op.operation_node
      add_option text: "Deposit money on a goal", node: @deposit_op.operation_node
    end
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @list_op.setup_back node: @menu_node
    @create_op.setup_back node: @menu_node
    @close_op.setup_back node: @menu_node
    @deposit_op.setup_back node: @menu_node
  end
end
