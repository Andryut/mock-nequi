class NavigationTree

  def initialize navigation_nodes:, session:
    access_menu = AccessMenu.new navigation_nodes: navigation_nodes, session: session
    @root = access_menu.menu_node
  end

  def play
    @root.play
  end
end
