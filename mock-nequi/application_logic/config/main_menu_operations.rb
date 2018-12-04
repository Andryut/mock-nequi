module MainOperations

  class CheckAvailableOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        account = session.current_user.general_account
        account.refresh
        puts '$%0.2f' % account.amount_money
        puts 'Press enter to continue'
        gets
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

  class CheckTotalOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        puts '$%0.2f' % session.current_user.total_money
        puts 'Press enter to continue'
        gets
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

  class DepositOP < OperationLeaf

    def build_input_views
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be deposited"
      amount_view_builder.with_validation method_name: :number
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          account = user.general_account
          account.deposit_money(amount: inputed_data[:amount].to_f)
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

    def build_operation_node navigation_nodes:, session:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      operation_node_builder.add_session session: session
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class WithdrawalOP < OperationLeaf

    def build_input_views
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be withdrawn"
      amount_view_builder.with_validation method_name: :number
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          account = user.general_account
          account.withdrawn_money(amount: inputed_data[:amount].to_f)
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

    def build_operation_node navigation_nodes:, session:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      operation_node_builder.add_session session: session
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class SendOP < OperationLeaf

    def build_input_views
      email_view_builder = InputViewBuilder.new
      email_view_builder.with_petition "Enter the email of the receiver email"
      email_view_builder.with_validation method_name: :email
      email_view_builder.with_hash key: :email
      @email_view = email_view_builder.build
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be sended"
      amount_view_builder.with_validation method_name: :number
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          account = user.general_account
          Movement.createTransfer transmitter_account:account, amount_money: inputed_data[:amount].to_f, receiver_email: inputed_data[:email]
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

    def build_operation_node navigation_nodes:, session:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      operation_node_builder.add_session session: session
      operation_node_builder.add_input view: @email_view
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class CheckTransactionsOP < OperationLeaf

    def build_input_views
      quantity_view_builder = InputViewBuilder.new
      quantity_view_builder.with_petition "Enter the maximum number of transactions you wish see"
      quantity_view_builder.with_validation method_name: :number
      quantity_view_builder.with_hash key: :quantity
      @quantity_view = quantity_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        account = session.current_user.general_account
        account.refresh
        max = inputed_data[:quantity].to_i
        transactionReport = TransactionReport.new(element_list: account.transaction_movements, limit: max)
        transactionReport.show
        transferReport = TransferReport.new(element_list: account.transfer_movements, limit: max)
        transferReport.show
      end
    end

    def build_operation_node navigation_nodes:, session:
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      operation_node_builder.add_session session: session
      operation_node_builder.add_input view: @quantity_view
      @operation_node = operation_node_builder.build
    end
  end
end
