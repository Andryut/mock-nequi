module MainOperations

  class CheckAvailableOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        account = session.current_user.general_account
        puts '$%0.2f' % account.amount_money
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
      amount_view_builder.with_validation expression: //
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          account = user.general_account
          account.deposit_money(amount: inputed_data[:amount].to_f)
          puts 'Money deposited correctly.'
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
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class WithdrawalOP < OperationLeaf

    def build_input_views
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be withdrawn"
      amount_view_builder.with_validation expression: //
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          account = user.general_account
          account.withdrawn_money(amount: inputed_data[:amount].to_f)
          puts 'Money withdrawn correctly.'
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
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class SendOP < OperationLeaf

    def build_input_views
      email_view_builder = InputViewBuilder.new
      email_view_builder.with_petition "Enter the email of the receiver email"
      email_view_builder.with_validation expression: //
      email_view_builder.with_hash key: :email
      @email_view = email_view_builder.build
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be sended"
      amount_view_builder.with_validation expression: //
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          account = user.general_account
          Movement.createTransfer transmitter_account:account, amount_money: inputed_data[:amount].to_f, receiver_email: inputed_data[:email]
          puts 'Money sent correctly.'
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
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class CheckTransactionsOP < OperationLeaf

    def build_input_views
      quantity_view_builder = InputViewBuilder.new
      quantity_view_builder.with_petition "Enter the maximum number of transactions you wish see"
      quantity_view_builder.with_validation expression: //
      quantity_view_builder.with_hash key: :quantity
      @quantity_view = quantity_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        user = session.current_user
        account = user.general_account
        max = inputed_data[:quantity].to_i

        transaction_movements = account.transaction_movements
        if transaction_movements.length > 0 and max > 0
          puts 'TRANSACTIONS:' 
        else
          puts 'There are no transactions to show'
        end
        puts ''
        count = 0
        transaction_movements.each do |transaction_movement|
          break unless count < max
          transaction = transaction_movement.transaction
          puts ' Date: ' + transaction_movement.date.to_s
          puts ' Amount: $%0.2f' % transaction_movement.amount_money
          puts ' Transaction type: ' + transaction.type
          puts ''
          count += 1
        end
        
        transfer_movements = account.transfer_movements
        if transfer_movements.length > 0 and max > 0
          puts 'TRANSFERS:' 
        else
          puts 'There are no transfers to show'
        end
        puts ''
        count = 0
        transfer_movements.each do |transfer_movement|
          break unless count < max
          transfer = transfer_movement.transfer
          puts ' Date: ' + transaction_movement.date.to_s
          puts ' Amount: $%0.2f' % transaction_movement.amount_money
          puts ' Receiver ' + transfer.receiver.email
          puts ''
          count += 1
        end
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
