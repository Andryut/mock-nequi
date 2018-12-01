module MainOperations

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

  class CheckTotalOP < Operation

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

  class SendOP < Operation

    def build_input_nodes
      email_node_builder = new InputNodeBuilder
      email_node_builder.with_petition "Enter the email of the receiver email"
      email_node_builder.with_validation expression: //
      email_node_builder.with_hash key: :email
      @email_node = email_node_builder.build
      amount_node_builder = new InputNodeBuilder
      amount_node_builder.with_petition "Enter the amount to be sended"
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
      operation_node_builder.add_input node: @email_node
      operation_node_builder.add_input node: @amount_node
      @operation_node = operation_node_builder.build
    end
  end

  class CheckTransactionsOP < Operation

    def build_input_nodes
      quantity_node_builder = new InputNodeBuilder
      quantity_node_builder.with_petition "Enter the maximum number of transactions you wish see"
      quantity_node_builder.with_validation expression: //
      quantity_node_builder.with_hash key: :quantity
      @quantity_node = quantity_node_builder.build
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
      operation_node_builder.add_input node: @quantity_node
      @operation_node = operation_node_builder.build
    end
  end
end
