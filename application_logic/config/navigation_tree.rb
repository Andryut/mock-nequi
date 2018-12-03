class NavigationTree

  def initialize model_objects:
    access_menu = AccessMenu.new model_objects: model_objects
    @root = access_menu.menu_node
  end

  def play
    @root.play
  end
end
