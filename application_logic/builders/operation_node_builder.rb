class OperationNodeBuilder

  def initialize
    @model_objects = Hash.new
    @input_views = Array.new
    @back_node = nil
  end

  def add_input view:
    @input_views << view
  end

  def add_model objects:
    @model_objects.merge!(objects)
  end

  def with_action proc:
    @action_proc = proc
  end

  def with_back node:
    @back_node = node
  end

  def build
    view = OperationView.new input_views: @input_views
    controller = OperationController.new action_proc: @action_proc
    controller.model_objects = @model_objects
    controller.back_node = @back_node
    return NavigationNode.new view: view, controller: controller
  end
end
