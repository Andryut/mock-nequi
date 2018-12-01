module GoalsOperations

  class ListOP < Operation

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

  class CreateOP < Operation

    def build_input_nodes
      goal_name_node_builder = new InputNodeBuilder
      goal_name_node_builder.with_petition "Enter the goal name"
      goal_name_node_builder.with_validation expression: //
      goal_name_node_builder.with_hash key: :name
      @goal_name_node = goal_name_node_builder.build
      amount_node_builder = new InputNodeBuilder
      amount_node_builder.with_petition "Enter the amount for the new goal"
      amount_node_builder.with_validation expression: //
      amount_node_builder.with_hash key: :amount
      @amount_node = amount_node_builder.build
      date_node_builder = new InputNodeBuilder
      date_node_builder.with_petition "Enter the limit date for the new goal dd-mm-yyyy"
      date_node_builder.with_validation expression: //
      date_node_builder.with_hash key: :date
      @date_node = date_node_builder.build
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
      operation_node_builder.add_input node: @goal_name_node
      operation_node_builder.add_input node: @amount_node
      operation_node_builder.add_input node: @date_node
      @operation_node = operation_node_builder.build
    end
  end

  class CloseOP < Operation

    def build_input_nodes
      goal_name_node_builder = new InputNodeBuilder
      goal_name_node_builder.with_petition "Enter the name of the goal that you wish to close"
      goal_name_node_builder.with_validation expression: //
      goal_name_node_builder.with_hash key: :name
      @goal_name_node = goal_name_node_builder.build
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
      operation_node_builder.add_input node: @goal_name_node
      @operation_node = operation_node_builder.build
    end
  end

  class DepositOP < Operation

    def build_input_nodes
      goal_name_node_builder = new InputNodeBuilder
      goal_name_node_builder.with_petition "Enter the name of the goal to make a deposit"
      goal_name_node_builder.with_validation expression: //
      goal_name_node_builder.with_hash key: :name
      @goal_name_node = goal_name_node_builder.build
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
      operation_node_builder.add_input node: @goal_name_node
      operation_node_builder.add_input node: @amount_node
      @operation_node = operation_node_builder.build
    end
  end
end
