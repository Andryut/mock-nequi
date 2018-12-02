module PocketsOperations

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
      pocket_name_view_builder = InputViewBuilder.new do
        with_petition "Enter the pocket name"
        with_validation expression: //
        with_hash key: :name
      end
      @pocket_name_view = pocket_name_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new do
        with_action proc: @action_proc
        add_model objects: model_objects
        add_input view: @pocket_name_view
      end
      @operation_node = operation_node_builder.build
    end
  end

  class DeleteOP < OperationLeaf

    def build_input_views
      pocket_name_view_builder = InputViewBuilder.new do
        with_petition "Enter the name of the pocket that you wish to delete"
        with_validation expression: //
        with_hash key: :name
      end
      @pocket_name_view = pocket_name_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new do
        with_action proc: @action_proc
        add_model objects: model_objects
        add_input view: @pocket_name_view
      end
      @operation_node = operation_node_builder.build
    end
  end

  class DepositOP < OperationLeaf

    def build_input_views
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
        add_input view: @amount_view
      end
      @operation_node = operation_node_builder.build
    end
  end

  class WithdrawalOP < OperationLeaf

    def build_input_views
      amount_view_builder = InputViewBuilder.new do
        with_petition "Enter the amount to be withdrawn"
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
        add_input view: @amount_view
      end
      @operation_node = operation_node_builder.build
    end
  end

  class SendOP < OperationLeaf

    def build_input_views
      email_view_builder = InputViewBuilder.new do
        with_petition "Enter the email of the receiver email"
        with_validation expression: //
        with_hash key: :email
      end
      @email_view = email_view_builder.build
      amount_view_builder = InputViewBuilder.new do
        with_petition "Enter the amount to be sended"
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
        add_input view: @email_view
        add_input view: @amount_view
      end
      @operation_node = operation_node_builder.build
    end
  end
end
