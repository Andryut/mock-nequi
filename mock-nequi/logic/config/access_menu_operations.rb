module AccessOperations

  class SignInOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter your email"
      email_view_builder = InputViewBuilder.new petition: petition, field_type: :email, key: :email
      @input_views << email_view_builder.build

      petition = "Enter your password"
      password_view_builder = InputViewBuilder.new petition: petition, field_type: :password,  key: :password
      @input_views << password_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, navigation_nodes, session|
        begin
          session.login(email: inputed_data[:email], password: inputed_data[:password])
          navigation_nodes[:main_menu].play
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

    def build_operation_node navigation_nodes:, session:
      operation_node_builder = OperationNodeBuilder.new(input_views: @input_views, action_proc: @action_proc, 
        navigation_nodes: navigation_nodes, session: session, dynamic: true)
        
      @operation_node = operation_node_builder.build
    end
  end

  class SignUpOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter your name"
      name_view_builder = InputViewBuilder.new petition: petition, field_type: :name, key: :name
      @input_views << name_view_builder.build

      petition = "Enter your email"
      email_view_builder = InputViewBuilder.new petition: petition, field_type: :email, key: :email
      @input_views <<  email_view_builder.build

      petition = "Enter your password"
      password_view_builder = InputViewBuilder.new petition: petition, field_type: :password, key: :password
      @input_views <<  password_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, navigation_nodes, session|
        begin
          session.create_and_login(name: inputed_data[:name], email: inputed_data[:email], password: inputed_data[:password])
          navigation_nodes[:main_menu].play
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

    def build_operation_node navigation_nodes:, session:
      operation_node_builder = OperationNodeBuilder.new(input_views: @input_views, action_proc: @action_proc, 
        navigation_nodes: navigation_nodes, session: session, dynamic: true)
      @operation_node = operation_node_builder.build
    end
  end
end
