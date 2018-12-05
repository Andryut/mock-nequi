class NavigationNode

  attr_accessor :controller, :view

  def initialize controller:, view:
    @controller = controller
    @view = view
  end

  def play
    input = view.show
    controller.execute input: input
  end
  
end
