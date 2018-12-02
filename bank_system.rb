class BankSystem

  def initialize
    self.configure_model
    self.configure_navigation_tree
  end

  def start
    @navigation_tree.play
  end

  protected

  def configure_navigation_tree
    model = {}
    @navigation_tree = NavigationTree.new model: model
  end

  def configure_model
  end
end
