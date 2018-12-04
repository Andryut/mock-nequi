module GoalsOperations

  class ListOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        user = session.current_user
        goal_coffers = user.goals
        goal_coffers.each do |goal_coffer|
          goal = goal_coffers.goal
          puts 'Name: ' + goal_coffer.name
          puts 'Total amount: $%0.2f' % goal.total_amount.to_f
          puts 'Saved money: $%0.2f' % goal_coffer.amount_money.to_f
          puts 'Remaining money: $%0.2f' % (goal.total_amount.to_f - goal_coffer.amount_money.to_f)
          puts 'Status: ' + goal_coffer.status
          puts 'Deadline: ' + goal.deadline.to_s
          puts ''
        end
      end
    end

    def build_operation_node navigation_nodes:, session:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      operation_node_builder.add_session session: session
      @operation_node = operation_node_builder.build
    end
  end

  class CreateOP < OperationLeaf

    def build_input_views
      goal_name_view_builder = InputViewBuilder.new
      goal_name_view_builder.with_petition "Enter the goal name"
      goal_name_view_builder.with_validation method_name: :goal_name
      goal_name_view_builder.with_hash key: :name
      @goal_name_view = goal_name_view_builder.build
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the target money amount"
      amount_view_builder.with_validation method_name: :number
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
      date_view_builder = InputViewBuilder.new
      date_view_builder.with_petition "Enter the maximum number of days to complete the goal"
      date_view_builder.with_validation method_name: :day
      date_view_builder.with_hash key: :days
      @date_view = date_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          user.add_goal(name: inputed_data[:name], total_amount: inputed_data[:amount].to_f, duration_in_days: inputed_data[:days].to_i)
          puts 'Goal created correctly'
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
      goal_name_view_builder.with_validation method_name: :goal_name
      goal_name_view_builder.with_hash key: :name
      @goal_name_view = goal_name_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          goals_dataset = session.current_user.goals_dataset
          goal = goals_dataset[name: inputed_data[:name]]
          unless goal.nil?
            goal.close
            goal = nil
            puts 'Goal closed correctly'
          else
            puts 'A goal with the entered name was not found'
          end
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
      operation_node_builder.add_input view: @goal_name_view
      @operation_node = operation_node_builder.build
    end
  end

  class DepositOP < OperationLeaf

    def build_input_views
      goal_name_view_builder = InputViewBuilder.new
      goal_name_view_builder.with_petition "Enter the name of the goal to make a deposit"
      goal_name_view_builder.with_validation method_name: :goal_name
      goal_name_view_builder.with_hash key: :name
      @goal_name_view = goal_name_view_builder.build
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be deposited"
      amount_view_builder.with_validation method_name: :number
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          goals_dataset = session.current_user.goals_dataset
          goal = goals_dataset[name: inputed_data[:name]]
          unless goal.nil?
            goal.deposit_money(amount: inputed_data[:amount])
            puts 'Money deposited correctly.'
          else
            puts 'A goal with the entered name was not found'
          end
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
      operation_node_builder.add_input view: @goal_name_view
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end
end
