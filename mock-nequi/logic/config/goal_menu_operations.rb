module GoalsOperations

  class ListOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        user = session.current_user
        user.refresh
        goal_coffers = user.goals
        
        goalsReport = GoalsReport.new(element_list: goal_coffers, limit: goal_coffers.length)
        goalsReport.show
      end
    end
  end

  class CreateOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the goal name"
      goal_name_view_builder = InputViewBuilder.new petition: petition, key: :name
      @input_views << goal_name_view_builder.build

      petition = "Enter the target money amount"
      amount_view_builder = InputViewBuilder.new petition: petition, field_type: :number, key: :amount
      @input_views << amount_view_builder.build

      petition = "Enter the maximum number of days to complete the goal"
      date_view_builder = InputViewBuilder.new petition: petition, field_type: :day, key: :days
      @input_views << date_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          user.add_goal(name: inputed_data[:name], total_amount: inputed_data[:amount].to_f, duration_in_days: inputed_data[:days].to_i)
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

  end

  class CloseOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the name of the goal that you wish to close"
      goal_name_view_builder = InputViewBuilder.new petition: petition, field_type: :text, key: :name
      @input_views << goal_name_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          goals_dataset = session.current_user.goals_dataset
          goal = goals_dataset[name: inputed_data[:name]]
          unless goal.nil?
            goal.close
            goal = nil
          else
            Error.new(message: 'The goal with the given name was not found') { |error| error.show }
          end
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

  end

  class DepositOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the name of the goal to make a deposit"
      goal_name_view_builder = InputViewBuilder.new petition: petition, field_type: :text, key: :name
      @input_views << goal_name_view_builder.build

      petition = "Enter the amount to be deposited"
      amount_view_builder = InputViewBuilder.new petition: petition, field_type: :number, key: :amount
      @input_views << amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          goals_dataset = session.current_user.goals_dataset
          goal = goals_dataset[name: inputed_data[:name]]
          unless goal.nil?
            goal.deposit_money(amount: inputed_data[:amount].to_f)
          else
            Error.new(message: 'A goal with the entered name was not found') { |error| error.show }
          end
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

  end
end
