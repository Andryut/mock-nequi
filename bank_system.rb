class BankSystem

  def initialize
    self.configure_model
    self.configure_navigation_tree
  end

  def start
    @navigation_tree.root.play
  end

  protected

  def configure_navigation_tree
    @navigation_tree = NavigationTree.new session: @session
  end

  def configure_model
    @session = Session.new
  end
end
