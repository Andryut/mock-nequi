class NavigationTree

  attr_reader :root

  def initialize session:
    access_menu = AccessMenu.new session: session
    @root = access_menu.menu_node
  end
end
