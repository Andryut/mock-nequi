class NavigationTree

  attr_reader :root

  def initialize model_objects:
    access_menu = AccessMenu.new model_objects: model_objects
    @root = access_menu.menu_node
  end
end
