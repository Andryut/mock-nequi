module MattressOperations

  class CheckAvailableOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        mattress = session.current_user.mattress
        mattress.refresh
        puts '$%0.2f' % mattress.amount_money
        puts 'Press enter to continue'
        gets
      end
    end

    def build_operation_node navigation_nodes:, session:
      operation_node_builder = OperationNodeBuilder.new(action_proc: @action_proc, 
        navigation_nodes: navigation_nodes, session: session)
      @operation_node = operation_node_builder.build
    end
  end

  class DepositOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the amount to be deposited"
      amount_view_builder = InputViewBuilder.new petition: petition, field_type: :number, key: :amount
      @input_views << amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          mattress = user.mattress
          mattress.deposit_money(amoutn: inputed_data[:amount].to_f)
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

  end

  class WithdrawalOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the amount to be withdrawn"
      amount_view_builder = InputViewBuilder.new petition: petition, field_type: :number, key: :amount
      @input_views << amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          mattress = user.mattress
          mattress.withdrawn_money(amount: inputed_data[:amount].to_f)
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

  end

end
