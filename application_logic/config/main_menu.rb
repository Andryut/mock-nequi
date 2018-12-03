class MainMenu < MenuTree

  def build_options_nodes navigation_nodes:
    @check_available_op = MainOperations::CheckAvailableOP.new navigation_nodes: navigation_nodes
    @check_total_op = MainOperations::CheckTotalOP.new navigation_nodes: navigation_nodes
    @deposit_op = MainOperations::DepositOP.new navigation_nodes: navigation_nodes
    @withdrawals_op = MainOperations::WithdrawalOP.new navigation_nodes: navigation_nodes
    @send_op = MainOperations::SendOP.new navigation_nodes: navigation_nodes
    @check_transactions_op = MainOperations::CheckTransactionsOP.new navigation_nodes: navigation_nodes
    @mattress_menu = MattressMenu.new navigation_nodes: navigation_nodes
    @pocket_menu = PocketMenu.new navigation_nodes: navigation_nodes
    @goal_menu = GoalMenu.new navigation_nodes: navigation_nodes
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "Check the available money", node: @check_available_op.operation_node
    menu_builder.add_option text: "Check the total money", node: @check_total_op.operation_node
    menu_builder.add_option text: "Deposit money", node: @deposit_op.operation_node
    menu_builder.add_option text: "Withdrawal money", node: @withdrawals_op.operation_node
    menu_builder.add_option text: "Send money to a friend", node: @send_op.operation_node
    menu_builder.add_option text: "Check the last n'th transactions", node: @check_transactions_op.operation_node
    menu_builder.add_option text: "Enter in the mattress menu", node: @mattress_menu.menu_node
    menu_builder.add_option text: "Enter in the pocket menu", node: @pocket_menu.menu_node
    menu_builder.add_option text: "Enter in the goal menu", node: @goal_menu.menu_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @check_available_op.setup_back node: @menu_node
    @check_total_op.setup_back node: @menu_node
    @deposit_op.setup_back node: @menu_node
    @withdrawals_op.setup_back node: @menu_node
    @send_op.setup_back node: @menu_node
    @check_transactions_op.setup_back node: @menu_node
    @mattress_menu.setup_menu_back text: "Back", node: @menu_node
    @pocket_menu.setup_menu_back text: "Back", node: @menu_node
    @goal_menu.setup_menu_back text: "Back", node: @menu_node
  end
end
