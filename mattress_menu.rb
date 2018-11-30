class MattressMenu < MenuTree

  def build_operation_nodes session:
    self.build_check_available_balance_node session: session
    self.build_deposit_node session: session
    self.build_withdrawals_node session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "Check the available money", node: @check_available_node
    menu_builder.add_option text: "Deposit money", node: @deposit_node
    menu_builder.add_option text: "Withdrawal money", node: @withdrawals_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @check_available_node.controller.back_node = @menu_node
    @deposit_node.controller.back_node = @menu_node
    @withdrawals_node.controller.back_node = @menu_node
  end

  protected

  def build_check_available_balance_node session:
  end

  def build_deposit_node session:
  end

  def build_withdrawals_node session:
  end
end
