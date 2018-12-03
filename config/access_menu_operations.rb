require './operation_leaf_template'

module AccessOperations

  class SignInOP < OperationLeaf

    def build_input_views
      email_view_builder = InputViewBuilder.new
      email_view_builder.with_petition "Enter your email"
      email_view_builder.with_validation expression: //
      email_view_builder.with_hash key: :email
      @email_view = email_view_builder.build
      password_view_builder = InputViewBuilder.new
      password_view_builder.with_petition "Enter your password"
      password_view_builder.with_validation expression: //
      password_view_builder.with_hash key: :password
      @password_view = password_view_builder.build
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
      operation_node_builder.add_input view: @password_view
      @operation_node = operation_node_builder.build
    end
  end

  class SignUpOP < OperationLeaf

    def build_input_views
      name_view_builder = InputViewBuilder.new
      name_view_builder.with_petition "Enter your name"
      name_view_builder.with_validation expression: //
      name_view_builder.with_hash key: :name
      @name_view = name_view_builder.build
      email_view_builder = InputViewBuilder.new
      email_view_builder.with_petition "Enter your email"
      email_view_builder.with_validation expression: //
      email_view_builder.with_hash key: :email
      @email_view = email_view_builder.build
      password_view_builder = InputViewBuilder.new
      password_view_builder.with_petition "Enter your password"
      password_view_builder.with_validation expression: //
      password_view_builder.with_hash key: :password
      @password_view = password_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, model_objects|
      end
    end

    def build_operation_node model_objects:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model objects: model_objects
      operation_node_builder.add_input view: @name_view
      operation_node_builder.add_input view: @email_view
      operation_node_builder.add_input view: @password_view
      @operation_node = operation_node_builder.build
    end
  end
end
