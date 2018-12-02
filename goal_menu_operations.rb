module GoalsOperations

  class ListOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new do
        with_action proc: @action_proc
        add_model objects: model_objects
      end
      @operation_node = operation_node_builder.build
    end
  end

  class CreateOP < OperationLeaf

    def build_input_views
      goal_name_view_builder = InputViewBuilder.new do
        with_petition "Enter the goal name"
        with_validation expression: //
        with_hash key: :name
      end
      @goal_name_view = goal_name_view_builder.build
      amount_view_builder = InputViewBuilder.new do
        with_petition "Enter the amount for the new goal"
        with_validation expression: //
        with_hash key: :amount
      end
      @amount_view = amount_view_builder.build
      date_view_builder = InputViewBuilder.new do
        with_petition "Enter the limit date for the new goal dd-mm-yyyy"
        with_validation expression: //
        with_hash key: :date
      end
      @date_view = date_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new do
        with_action proc: @action_proc
        add_model objects: model_objects
        add_input view: @goal_name_view
        add_input view: @amount_view
        add_input view: @date_view
      end
      @operation_node = operation_node_builder.build
    end
  end

  class CloseOP < OperationLeaf

    def build_input_views
      goal_name_view_builder = InputViewBuilder.new do
        with_petition "Enter the name of the goal that you wish to close"
        with_validation expression: //
        with_hash key: :name
      end
      @goal_name_view = goal_name_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new do
        with_action proc: @action_proc
        add_model objects: model_objects
        add_input view: @goal_name_view
      end
      @operation_node = operation_node_builder.build
    end
  end

  class DepositOP < OperationLeaf

    def build_input_views
      goal_name_view_builder = InputViewBuilder.new do
        with_petition "Enter the name of the goal to make a deposit"
        with_validation expression: //
        with_hash key: :name
      end
      @goal_name_view = goal_name_view_builder.build
      amount_view_builder = InputViewBuilder.new do
        with_petition "Enter the amount to be deposited"
        with_validation expression: //
        with_hash key: :amount
      end
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new do
        with_action proc: @action_proc
        add_model objects: model_objects
        add_input view: @goal_name_view
        add_input view: @amount_view
      end
      @operation_node = operation_node_builder.build
    end
  end
end
