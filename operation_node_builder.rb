class OperationNodeBuilder

  def initialize
    @model_objects = Hash.new
    @input_views = Array.new
    @back_node = nil
    yield if block_given?
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

  def buid
    view = OperationView.new input_views: @input_views
    controller = OperationController.new action_proc: @action_proc do
      self.model_objects = @model_objects
      self.back_node = @back_node
    end
    return NavigationNode.new view: view, controller: controller
  end
end
