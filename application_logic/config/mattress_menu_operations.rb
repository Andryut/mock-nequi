module MattressOperations

  class CheckAvailableOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, navigation_nodes|
      end
    end

    def build_operation_node navigation_nodes:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      @operation_node = operation_node_builder.build
    end
  end

  class DepositOP < OperationLeaf

    def build_input_views
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be deposited"
      amount_view_builder.with_validation expression: //
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, navigation_nodes|
      end
    end

    def build_operation_node navigation_nodes:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class WithdrawalOP < OperationLeaf

    def build_input_views
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be withdrawn"
      amount_view_builder.with_validation expression: //
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, navigation_nodes|
      end
    end

    def build_operation_node navigation_nodes:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end
end
