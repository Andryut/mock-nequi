class MainMenu < MenuTree

  def build_operation_nodes session:

  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    @menu_node = menu_builder.build
  end

  def setup_back_nodes

  end

  def setup_menu_back text:, node:
    @menu_node.controller.back_option = node
    @menu_node.view.back_option = text
  end

  protected


end
