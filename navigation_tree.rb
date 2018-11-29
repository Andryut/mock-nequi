class NavigationTree

  attr_reader :root

  def initialize session:
    login_menu = LoginMenu.new session: session
    @root = login_menu.menu_node
  end
end
