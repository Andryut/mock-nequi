class AccessMenu < MenuTree

  def build_options_nodes session:
    @main_menu = MainMenu.new session: session
    configured_data = {:session => session, :main_menu => @main_menu}
    @sign_in_op = AccessOperations::SignInOP.new configured_data: configured_data
    @sign_up_op = AccessOperations::SignUpOP.new configured_data: configured_data
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "Sign in", node: @sign_in_op.operation_node
    menu_builder.add_option text: "Sign up", node: @sign_up_op.operation_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @sign_in_op.setup_back node: @menu_node
    @sign_up_op.setup_back node: @menu_node
    @main_menu.setup_menu_back text: "Sign out", node: @menu_node
  end
end
