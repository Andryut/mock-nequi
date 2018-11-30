class MainMenu < MenuTree

  def build_options_nodes session:
    self.build_check_available_balance_node session: session
    self.build_check_total_balance_node session: session
    self.build_deposit_node session: session
    self.build_withdrawals_dinero_node session: session
    self.build_send_money_node session: session
    self.build_check_transactions_node session: session
    @mattress_menu = MattressMenu.new session: session
    @pocket_menu = PocketMenu.new session: session
    @goal_menu = GoalMenu.new session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "Check the available money", node: @check_available_node
    menu_builder.add_option text: "Check the total money", node: @check_total_node
    menu_builder.add_option text: "Deposit money", node: @deposit_node
    menu_builder.add_option text: "Withdrawal money", node: @withdrawals_node
    menu_builder.add_option text: "Send money to a friend", node: @send_node
    menu_builder.add_option text: "Check the last n'th transactions", node: @check_transactions_node
    menu_builder.add_option text: "Enter in the mattress menu", node: @mattress_menu.menu_node
    menu_builder.add_option text: "Enter in the pocket menu", node: @pocket_menu.menu_node
    menu_builder.add_option text: "Enter in the goal menu", node: @goal_menu.menu_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @check_available_node.controller.back_node = @menu_node
    @check_total_node.controller.back_node = @menu_node
    @deposit_node.controller.back_node = @menu_node
    @withdrawals_node.controller.back_node = @menu_node
    @send_node.controller.back_node = @menu_node
    @check_transactions_node.controller.back_node = @menu_node
    @mattress_menu.setup_menu_back text: "Back", node: @menu_node
    @pocket_menu.setup_menu_back text: "Back", node: @menu_node
    @goal_menu.setup_menu_back text: "Back", node: @menu_node
  end
end
