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
    model_objects = {curent_user: @current_user}
    @navigation_tree = NavigationTree.new model_objects: model_objects
  end

  def configure_model
    @current_user = nil
  end
end
