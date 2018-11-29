class LoginMenu < MenuTree

  def build_operation_nodes session:
    @main_menu = MainMenu.new session: session
    self.build_login_node session: session
    self.build_register_node session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "Sing in", node: @sing_in_node
    menu_builder.add_option text: "Sing up", node: @sing_up_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @sing_in_node.controller.back_node = @menu_node
    @sing_up_node.controller.back_node = @menu_node
    @main_menu.setup_menu_back text: "Log out", node: @menu_node
  end

  protected

  def build_login_node session:
  end

  def build_register_node session:
  end
end
