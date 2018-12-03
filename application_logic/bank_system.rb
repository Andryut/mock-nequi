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
    model_objects = {}
    @navigation_tree = NavigationTree.new model_objects: model_objects
  end

  def configure_model
  end
end
