class MenuTree

  attr_reader :menu_node

  def initialize navigation_nodes:, session:
    self.build_options_nodes navigation_nodes: navigation_nodes, session: session
    self.build_menu_node
    self.setup_back_nodes
  end

  def build_options_nodes navigation_nodes:, session:
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
  end

  def play
    @menu_node.play
  end

  def setup_menu_back text:, node:
    @menu_node.view.back_option = text
    @menu_node.controller.back_option = node
  end
  
end
