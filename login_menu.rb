class LoginMenu < MenuTree

  def build_operation_nodes session:
    @main_menu = MainMenu.new session: session
    self.build_login_node session: session
    self.build_register_node session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "Sign in", node: @sign_in_node
    menu_builder.add_option text: "Sign up", node: @sign_up_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @sign_in_node.controller.back_node = @menu_node
    @sign_up_node.controller.back_node = @menu_node
    @main_menu.setup_menu_back text: "Sign out", node: @menu_node
  end

  protected

  def build_login_node session:
    sign_in_builder = OperationNodeBuilder.new
    sign_in_builder.with_validation proc: validation_proc
    sign_in_builder.with_action proc: action_proc
    sign_in_builder.add_configured_data key: :session, value: session
    sign_in_builder.add_input view: input_node
    @sign_in_node = sign_in_builder.build
  end

  def build_register_node session:
  end
end
