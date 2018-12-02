class AccessMenu < MenuTree

  def build_options_nodes model_objects:
    @main_menu = MainMenu.new model_objects: model_objects
    model_objects.merge!{:main_menu => @main_menu}
    @sign_in_op = AccessOperations::SignInOP.new model_objects: model_objects
    @sign_up_op = AccessOperations::SignUpOP.new model_objects: model_objects
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new do
      add_option text: "Sign in", node: @sign_in_op.operation_node
      add_option text: "Sign up", node: @sign_up_op.operation_node
    end
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @sign_in_op.setup_back node: @menu_node
    @sign_up_op.setup_back node: @menu_node
    @main_menu.setup_menu_back text: "Sign out", node: @menu_node
  end
end
