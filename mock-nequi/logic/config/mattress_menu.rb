class MattressMenu < MenuTree

  def build_options_nodes navigation_nodes:, session:
    @check_available_op = MattressOperations::CheckAvailableOP.new navigation_nodes: navigation_nodes, session: session
    @deposit_op = MattressOperations::DepositOP.new navigation_nodes: navigation_nodes, session: session
    @withdrawals_op = MattressOperations::WithdrawalOP.new navigation_nodes: navigation_nodes, session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "Check the available money", node: @check_available_op.operation_node
    menu_builder.add_option text: "Deposit money", node: @deposit_op.operation_node
    menu_builder.add_option text: "Withdrawal money", node: @withdrawals_op.operation_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @check_available_op.setup_back node: @menu_node
    @deposit_op.setup_back node: @menu_node
    @withdrawals_op.setup_back node: @menu_node
  end
  
end
