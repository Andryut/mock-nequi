class MenuTree

  attr_reader :menu_node

  def initialize model_objects:
    self.build_options_nodes model_objects: model_objects
    self.build_menu_node
    self.setup_back_nodes
  end

  def build_options_nodes model_objects:
  end

  def build_menu_node
  end

  def setup_back_nodes
  end

  def setup_menu_back text:, node:
    @menu_node.view.back_option = text
    @menu_node.controller.back_option = node
  end
end
