require_relative 'operation_leaf_template.rb'

module AccessOperations

  class SignInOP < OperationLeaf

    def build_input_views
      email_view_builder = InputViewBuilder.new
      email_view_builder.with_petition "Enter your email"
      email_view_builder.with_validation method_name: :email
      email_view_builder.with_hash key: :email
      @email_view = email_view_builder.build
      password_view_builder = InputViewBuilder.new
      password_view_builder.with_petition "Enter your password"
      password_view_builder.with_validation method_name: :password
      password_view_builder.with_hash key: :password
      @password_view = password_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, navigation_nodes, session|
        begin
          session.login(email: inputed_data[:email], password: inputed_data[:password])
          puts 'Welcome '+ session.current_user.name
          navigation_nodes[:main_menu].play
        rescue => exception
          puts exception.message
        end
      end
    end

    def build_operation_node navigation_nodes:, session:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      operation_node_builder.add_session session: session
      operation_node_builder.add_input view: @email_view
      operation_node_builder.add_input view: @password_view
      operation_node_builder.set_dynamic
      @operation_node = operation_node_builder.build
    end
  end

  class SignUpOP < OperationLeaf

    def build_input_views
      name_view_builder = InputViewBuilder.new
      name_view_builder.with_petition "Enter your name"
      name_view_builder.with_validation method_name: :name
      name_view_builder.with_hash key: :name
      @name_view = name_view_builder.build
      email_view_builder = InputViewBuilder.new
      email_view_builder.with_petition "Enter your email"
      email_view_builder.with_validation method_name: :email
      email_view_builder.with_hash key: :email
      @email_view = email_view_builder.build
      password_view_builder = InputViewBuilder.new
      password_view_builder.with_petition "Enter your password"
      password_view_builder.with_validation method_name: :password
      password_view_builder.with_hash key: :password
      @password_view = password_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, navigation_nodes, session|
        begin
          session.create_and_login(name: inputed_data[:name], email: inputed_data[:email], password: inputed_data[:password])
          puts 'Congratulations, you have successfully registered'
          puts 'Welcome '+ session.current_user
          navigation_nodes[:main_menu].play
        rescue => exception
          puts exception.message
        end
      end
    end

    def build_operation_node navigation_nodes:, session:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      operation_node_builder.add_session session: session
      operation_node_builder.add_input view: @name_view
      operation_node_builder.add_input view: @email_view
      operation_node_builder.add_input view: @password_view
      operation_node_builder.set_dynamic
      @operation_node = operation_node_builder.build
    end
  end
end
