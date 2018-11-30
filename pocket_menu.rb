class PocketMenu < MenuTree

  def build_options_nodes session:
    self.build_list_pockets_info_node session: session
    self.build_create_pocket_node session: session
    self.build_delete_pocket_node session: session
    self.build_deposit_node session: session
    self.build_withdrawals_node session: session
    self.build_send_money_node session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "List all the pockets", node: @list_node
    menu_builder.add_option text: "Create a pocket", node: @create_node
    menu_builder.add_option text: "Delete a pocket", node: @delete_node
    menu_builder.add_option text: "Deposit money to a pocket", node: @deposit_node
    menu_builder.add_option text: "Withdrawal money from a pocket", node: @withdrawals_node
    menu_builder.add_option text: "Send money to a friend from a pocket", node: @send_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @list_node.controller.back_node = @menu_node
    @create_node.controller.back_node = @menu_node
    @delete_node.controller.back_node = @menu_node
    @deposit_node.controller.back_node = @menu_node
    @withdrawals_node.controller.back_node = @menu_node
    @send_node.controller.back_node = @menu_node
  end
end
