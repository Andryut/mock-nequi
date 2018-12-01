module MattressOperations

  class CheckAvailableOP < Operation

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
      @operation_node = operation_node_builder.build
    end
  end

  class DepositOP < Operation

    def build_input_nodes
      amount_node_builder = new InputNodeBuilder
      amount_node_builder.with_petition "Enter the amount to be deposited"
      amount_node_builder.with_validation expression: //
      amount_node_builder.with_hash key: :amount
      @amount_node = amount_node_builder.build
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
      operation_node_builder.add_input node: @amount_node
      @operation_node = operation_node_builder.build
    end
  end

  class WithdrawalOP < Operation

    def build_input_nodes
      amount_node_builder = new InputNodeBuilder
      amount_node_builder.with_petition "Enter the amount to be withdrawn"
      amount_node_builder.with_validation expression: //
      amount_node_builder.with_hash key: :amount
      @amount_node = amount_node_builder.build
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
      operation_node_builder.add_input node: @amount_node
      @operation_node = operation_node_builder.build
    end
  end
end
