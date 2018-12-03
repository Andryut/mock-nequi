class PocketMenu < MenuTree

  def build_options_nodes navigation_nodes:, session:
    @list_op = PocketsOperations::ListOP.new navigation_nodes: navigation_nodes, session: session
    @create_op = PocketsOperations::CreateOP.new navigation_nodes: navigation_nodes, session: session
    @delete_op = PocketsOperations::DeleteOP.new navigation_nodes: navigation_nodes, session: session
    @deposit_op = PocketsOperations::DepositOP.new navigation_nodes: navigation_nodes, session: session
    @withdrawals_op = PocketsOperations::WithdrawalOP.new navigation_nodes: navigation_nodes, session: session
    @send_op = PocketsOperations::SendOP.new navigation_nodes: navigation_nodes, session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "List all the pockets", node: @list_op.operation_node
    menu_builder.add_option text: "Create a pocket", node: @create_op.operation_node
    menu_builder.add_option text: "Delete a pocket", node: @delete_op.operation_node
    menu_builder.add_option text: "Deposit money to a pocket", node: @deposit_op.operation_node
    menu_builder.add_option text: "Withdrawal money from a pocket", node: @withdrawals_op.operation_node
    menu_builder.add_option text: "Send money to a friend from a pocket", node: @send_op.operation_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @list_op.setup_back node: @menu_node
    @create_op.setup_back node: @menu_node
    @delete_op.setup_back node: @menu_node
    @deposit_op.setup_back node: @menu_node
    @withdrawals_op.setup_back node: @menu_node
    @send_op.setup_back node: @menu_node
  end
end
