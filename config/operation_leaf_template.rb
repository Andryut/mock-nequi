class OperationLeaf

  attr_reader :operation_node

  def initialize model_objects:
    self.build_input_views
    self.setup_action
    self.build_operation_node model_objects: model_objects
  end

  def build_input_views
  end

  def setup_action
  end

  def build_operation_node model_objects:
  end

  def setup_back node:
    @operation_node.controller.back_node = node
  end

end
