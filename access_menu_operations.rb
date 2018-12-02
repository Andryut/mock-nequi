module AccessOperations

  class SignInOP < OperationLeaf

    def build_input_views
      email_view_builder = InputViewBuilder.new do
        with_petition "Enter your email"
        with_validation expression: //
        with_hash key: :email
      end
      @email_view = email_view_builder.build
      password_view_builder = InputViewBuilder.new do
        with_petition "Enter your password"
        with_validation expression: //
        with_hash key: :password
      end
      @password_view = password_view_builder.build
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
        add_input view: @password_view
      end
      @operation_node = operation_node_builder.build
    end
  end

  class SignUpOP < OperationLeaf

    def build_input_views
      name_view_builder = InputViewBuilder.new do
        with_petition "Enter your name"
        with_validation expression: //
        with_hash key: :name
      end
      @name_view = name_view_builder.build
      email_view_builder = InputViewBuilder.new do
        with_petition "Enter your email"
        with_validation expression: //
        with_hash key: :email
      end
      @email_view = email_view_builder.build
      password_view_builder = InputViewBuilder.new do
        with_petition "Enter your password"
        with_validation expression: //
        with_hash key: :password
      end
      @password_view = password_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new do
        with_action proc: @action_proc
        add_model objects: model_objects
        add_input view: @name_view
        add_input view: @email_view
        add_input view: @password_view
      end
      @operation_node = operation_node_builder.build
    end
  end
end
