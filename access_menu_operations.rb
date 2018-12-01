module AccessOperations

  class SignInOP < Operation

    def build_input_nodes
      email_node_builder = new InputNodeBuilder
      email_node_builder.with_petition "Enter your email"
      email_node_builder.with_validation expression: //
      email_node_builder.with_hash key: :email
      @email_node = email_node_builder.build
      password_node_builder = new InputNodeBuilder
      password_node_builder.with_petition "Enter your password"
      password_node_builder.with_validation expression: //
      password_node_builder.with_hash key: :password
      @password_node = password_node_builder.build
    end

    def setup_procs
      @validation_proc = Proc.new do |inputed_data, configured_data|
      end
      @action_proc = Proc.new do |inputed_data, configured_data|
      end
    end

    def build_operation_node configured_data:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_validation proc: @validation_proc
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_configured data: configured_data
      operation_node_builder.add_input node: @email_node
      operation_node_builder.add_input node: @password_node
      @operation_node = operation_node_builder.build
    end
  end

  class SignUpOP < Operation

    def build_input_nodes
      name_node_builder = new InputNodeBuilder
      name_node_builder.with_petition "Enter your name"
      name_node_builder.with_validation expression: //
      name_node_builder.with_hash key: :name
      @name_node = name_node_builder.build
      email_node_builder = new InputNodeBuilder
      email_node_builder.with_petition "Enter your email"
      email_node_builder.with_validation expression: //
      email_node_builder.with_hash key: :email
      @email_node = email_node_builder.build
      password_node_builder = new InputNodeBuilder
      password_node_builder.with_petition "Enter your password"
      password_node_builder.with_validation expression: //
      password_node_builder.with_hash key: :password
      @password_node = password_node_builder.build
    end

    def setup_procs
      @validation_proc = Proc.new do |inputed_data, configured_data|
      end
      @action_proc = Proc.new do |inputed_data, configured_data|
      end
    end

    def build_operation_node configured_data:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_validation proc: @validation_proc
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_configured data: configured_data
      operation_node_builder.add_input node: @name_node
      operation_node_builder.add_input node: @email_node
      operation_node_builder.add_input node: @password_node
      @operation_node = operation_node_builder.build
    end
  end
end
