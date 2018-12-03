module GoalsOperations

  class ListOP < OperationLeaf

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

  class CreateOP < OperationLeaf

    def build_input_views
      goal_name_view_builder = InputViewBuilder.new
      goal_name_view_builder.with_petition "Enter the goal name"
      goal_name_view_builder.with_validation expression: //
      goal_name_view_builder.with_hash key: :name
      @goal_name_view = goal_name_view_builder.build
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount for the new goal"
      amount_view_builder.with_validation expression: //
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
      date_view_builder = InputViewBuilder.new
      date_view_builder.with_petition "Enter the limit date for the new goal dd-mm-yyyy"
      date_view_builder.with_validation expression: //
      date_view_builder.with_hash key: :date
      @date_view = date_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model objects: model_objects
      operation_node_builder.add_input view: @goal_name_view
      operation_node_builder.add_input view: @amount_view
      operation_node_builder.add_input view: @date_view
      @operation_node = operation_node_builder.build
    end
  end

  class CloseOP < OperationLeaf

    def build_input_views
      goal_name_view_builder = InputViewBuilder.new
      goal_name_view_builder.with_petition "Enter the name of the goal that you wish to close"
      goal_name_view_builder.with_validation expression: //
      goal_name_view_builder.with_hash key: :name
      @goal_name_view = goal_name_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model objects: model_objects
      operation_node_builder.add_input view: @goal_name_view
      @operation_node = operation_node_builder.build
    end
  end

  class DepositOP < OperationLeaf

    def build_input_views
      goal_name_view_builder = InputViewBuilder.new
      goal_name_view_builder.with_petition "Enter the name of the goal to make a deposit"
      goal_name_view_builder.with_validation expression: //
      goal_name_view_builder.with_hash key: :name
      @goal_name_view = goal_name_view_builder.build
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
      operation_node_builder.add_input view: @goal_name_view
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end
end
