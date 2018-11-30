class Operation

  attr_reader :operation_node

  def initialize configured_data:
    self.build_input_nodes
    self.setup_procs
    self.build_operation_node configured_data: configured_data
  end

  def build_input_nodes
  end

  def setup_procs
  end

  def build_operation_node configured_data: configured_data
  end

  def setup_back node:
    @operation_node.controller.back_node = node
  end

end
