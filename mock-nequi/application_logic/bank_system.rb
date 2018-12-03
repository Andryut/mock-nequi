require_relative 'dependencies.rb'

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
    navigation_nodes = {}
    @navigation_tree = NavigationTree.new navigation_nodes: navigation_nodes
  end

  def configure_model
    Session.current_user = User.default_user
  end
end
