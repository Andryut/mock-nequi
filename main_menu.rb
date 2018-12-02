class MainMenu < MenuTree

  def build_options_nodes model_objects:
    @check_available_op = MainOperations::CheckAvailableOP.new model_objects: model_objects
    @check_total_op = MainOperations::CheckTotalOP.new model_objects: model_objects
    @deposit_op = MainOperations::DepositOP.new model_objects: model_objects
    @withdrawals_op = MainOperations::WithdrawalOP.new model_objects: model_objects
    @send_op = MainOperations::SendOP.new model_objects: model_objects
    @check_transactions_op = MainOperations::CheckTransactionsOP.new model_objects: model_objects
    @mattress_menu = MattressMenu.new model_objects: model_objects
    @pocket_menu = PocketMenu.new model_objects: model_objects
    @goal_menu = GoalMenu.new model_objects: model_objects
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new do
      add_option text: "Check the available money", node: @check_available_op.operation_node
      add_option text: "Check the total money", node: @check_total_op.operation_node
      add_option text: "Deposit money", node: @deposit_op.operation_node
      add_option text: "Withdrawal money", node: @withdrawals_op.operation_node
      add_option text: "Send money to a friend", node: @send_op.operation_node
      add_option text: "Check the last n'th transactions", node: @check_transactions_op.operation_node
      add_option text: "Enter in the mattress menu", node: @mattress_menu.menu_node
      add_option text: "Enter in the pocket menu", node: @pocket_menu.menu_node
      add_option text: "Enter in the goal menu", node: @goal_menu.menu_node
    end
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
