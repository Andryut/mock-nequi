class MenuNodeBuilder

  def initialize
    @view_options = Array.new
    @node_options = Array.new
    @back_option = {:text => "exit", :node => nil}
  end

  def with_back_option text:, node:
    @back_option = {:text => text, :node => node}
  end

  def add_option text:, node:
    @view_options << text
    @node_options << node
  end

  def build
    view = MenuView.new
    view.option_nodes = @view_options
    view.back_option = @back_option[:text]
    controller = MenuController.new
    controller.option_nodes = @node_options
    controller.back_option = @back_option[:node]
    return NavigationNode.new view: view, controller: controller
  end
  
end
