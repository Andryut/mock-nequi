module MainOperations

  class CheckAvailableOP < Operation

    def build_input_nodes
      input_node_a_builder = new InputNodeBuilder
      input_node_a_builder.with_petition ""
      input_node_a_builder.with_validation expression: //
      input_node_a_builder.with_hash key: :key
      @input_node_a = input_node_a_builder.build
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
      operation_node_builder.add_input node: @input_node_a
      @operation_node = operation_node_builder.build
    end
  end

  class CheckTotalOP < Operation

    def build_input_nodes
      input_node_a_builder = new InputNodeBuilder
      input_node_a_builder.with_petition ""
      input_node_a_builder.with_validation expression: //
      input_node_a_builder.with_hash key: :key
      @input_node_a = input_node_a_builder.build
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
      operation_node_builder.add_input node: @input_node_a
      @operation_node = operation_node_builder.build
    end
  end

  class DepositOP < Operation

    def build_input_nodes
      input_node_a_builder = new InputNodeBuilder
      input_node_a_builder.with_petition ""
      input_node_a_builder.with_validation expression: //
      input_node_a_builder.with_hash key: :key
      @input_node_a = input_node_a_builder.build
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
      operation_node_builder.add_input node: @input_node_a
      @operation_node = operation_node_builder.build
    end
  end

  class WithdrawalOP < Operation

    def build_input_nodes
      input_node_a_builder = new InputNodeBuilder
      input_node_a_builder.with_petition ""
      input_node_a_builder.with_validation expression: //
      input_node_a_builder.with_hash key: :key
      @input_node_a = input_node_a_builder.build
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
      operation_node_builder.add_input node: @input_node_a
      @operation_node = operation_node_builder.build
    end
  end

  class SendOP < Operation

    def build_input_nodes
      input_node_a_builder = new InputNodeBuilder
      input_node_a_builder.with_petition ""
      input_node_a_builder.with_validation expression: //
      input_node_a_builder.with_hash key: :key
      @input_node_a = input_node_a_builder.build
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
      operation_node_builder.add_input node: @input_node_a
      @operation_node = operation_node_builder.build
    end
  end

  class CheckTransactionsOP < Operation

    def build_input_nodes
      input_node_a_builder = new InputNodeBuilder
      input_node_a_builder.with_petition ""
      input_node_a_builder.with_validation expression: //
      input_node_a_builder.with_hash key: :key
      @input_node_a = input_node_a_builder.build
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
      operation_node_builder.add_input node: @input_node_a
      @operation_node = operation_node_builder.build
    end
  end
end
