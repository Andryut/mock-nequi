class MenuTree

  attr_reader :menu_node

  def initialize session:
    self.build_operation_nodes session: session
    self.build_menu_node
    self.setup_back_nodes
  end

  def build_operation_nodes session:
  end

  def build_menu_node
  end

  def setup_back_nodes
  end
end
