class NavigationNode

  def initialize controller:, view:
    @controller = controller
    @view = view
  end

  def play
    inputed_data = view.show
    controller.execute inputed_data: inputed_data
  end
end
