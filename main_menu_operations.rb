module MainOperations

  class CheckAvailableOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model objects: model_objects
      @operation_node = operation_node_builder.build
    end
  end

  class CheckTotalOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model objects: model_objects
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
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model objects: model_objects
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
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model objects: model_objects
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class SendOP < OperationLeaf

    def build_input_views
      email_view_builder = InputViewBuilder.new
      email_view_builder.with_petition "Enter the email of the receiver email"
      email_view_builder.with_validation expression: //
      email_view_builder.with_hash key: :email
      @email_view = email_view_builder.build
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be sended"
      amount_view_builder.with_validation expression: //
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model objects: model_objects
      operation_node_builder.add_input view: @email_view
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class CheckTransactionsOP < OperationLeaf

    def build_input_views
      quantity_view_builder = InputViewBuilder.new
      quantity_view_builder.with_petition "Enter the maximum number of transactions you wish see"
      quantity_view_builder.with_validation expression: //
      quantity_view_builder.with_hash key: :quantity
      @quantity_view = quantity_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model objects: model_objects
      operation_node_builder.add_input view: @quantity_view
      @operation_node = operation_node_builder.build
    end
  end
end
