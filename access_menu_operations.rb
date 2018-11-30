module AccessOperations
  
  def build_login_node session:
    input_node_a_builder = new InputNodeBuilder
    input_node_a_builder.with_petition ""
    input_node_a_builder.with_validation expression: //
    input_node_a_builder.with_hash key: :key
    input_node_a = input_node_a_builder.build
    validation_proc = Proc.new do |inputed_data, configured_data|
    end
    action_proc = Proc.new do |inputed_data, configured_data|
    end
    node_builder = OperationNodeBuilder.new
    node_builder.with_validation proc: validation_proc
    node_builder.with_action proc: action_proc
    node_builder.add_configured_data key: :session, value: session
    node_builder.add_input node: input_node_a
    @node = node_builder.build
  end

  def build_register_node session:
    input_node_a_builder = new InputNodeBuilder
    input_node_a_builder.with_petition ""
    input_node_a_builder.with_validation expression: //
    input_node_a_builder.with_hash key: :key
    input_node_a = input_node_a_builder.build
    validation_proc = Proc.new do |inputed_data, configured_data|
    end
    action_proc = Proc.new do |inputed_data, configured_data|
    end
    node_builder = OperationNodeBuilder.new
    node_builder.with_validation proc: validation_proc
    node_builder.with_action proc: action_proc
    node_builder.add_configured_data key: :session, value: session
    node_builder.add_input node: input_node_a
    @node = node_builder.build
  end
end
