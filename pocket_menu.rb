class PocketMenu < MenuTree

  def build_options_nodes session:
    configured_data = {:session => session}
    @list_op = PocketsOperations::ListOP.new configured_data: configured_data
    @create_op = PocketsOperations::CreateOP.new configured_data: configured_data
    @delete_op = PocketsOperations::DeleteOP.new configured_data: configured_data
    @deposit_op = PocketsOperations::DepositOP.new configured_data: configured_data
    @withdrawals_op = PocketsOperations::WithdrawalsOP.new configured_data: configured_data
    @send_op = PocketsOperations::SendOP.new configured_data: configured_data
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
