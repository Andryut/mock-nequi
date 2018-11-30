class GoalMenu < MenuTree

  def build_options_nodes session:
    self.build_list_goals_info_node session: session
    self.build_create_goal_node session: session
    self.build_close_goal_node session: session
    self.build_deposit_node session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "List all the goals", node: @list_node
    menu_builder.add_option text: "Create a goal", node: @create_node
    menu_builder.add_option text: "Close a goal", node: @close_node
    menu_builder.add_option text: "Deposit money on a goal", node: @deposit_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @list_node.controller.back_node = @menu_node
    @create_node.controller.back_node = @menu_node
    @close_node.controller.back_node = @menu_node
    @deposit_node.controller.back_node = @menu_node
  end
end
