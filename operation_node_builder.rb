class OperationNodeBuilder

  def initialize
    @configured_data = Hash.new
    @input_views = Array.new
    @back_node = nil
  end

  def add_input view:
    @input_views << view
  end

  def add_configured_data key:, value:
    @configured_data.merge!({key => value})
  end

  def with_validation proc:
    @validation_proc = proc
  end

  def with_action proc:
    @action_proc = proc
  end

  def with_back node:
    @back_node = node
  end

  def buid
    view = OperationView.new input_views: @input_views
    controller = OperationController.new validation_proc: @validation_proc, action_proc: @action_proc
    controller.configured_data = @configured_data
    controller.back_node = @back_node
    return NavigationNode.new view: view, controller: controller
  end
end
