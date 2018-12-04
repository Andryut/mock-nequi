module PocketsOperations

  class ListOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        user = session.current_user
        pocket_accounts = user.pockets
        pocket_accounts.each do |pocket_account|
          puts 'Name: ' + pocket_account.name
          puts 'Balance: $%0.2f' % pocket_account.amount_money
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
      pocket_name_view_builder = InputViewBuilder.new
      pocket_name_view_builder.with_petition "Enter the pocket name"
      pocket_name_view_builder.with_validation method_name: :pocket_name
      pocket_name_view_builder.with_hash key: :name
      @pocket_name_view = pocket_name_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          user.add_pocket(name: inputed_data[:name])
          puts 'Pocket created correctly'
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
      operation_node_builder.add_input view: @pocket_name_view
      @operation_node = operation_node_builder.build
    end
  end

  class DeleteOP < OperationLeaf

    def build_input_views
      pocket_name_view_builder = InputViewBuilder.new
      pocket_name_view_builder.with_petition "Enter the name of the pocket that you wish to delete"
      pocket_name_view_builder.with_validation method_name: :pocket_name
      pocket_name_view_builder.with_hash key: :name
      @pocket_name_view = pocket_name_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          pockets_dataset = session.current_user.pockets_dataset
          pocket = pockets_dataset[name: inputed_data[:name]]
          unless pocket.nil?
            pocket.delete
            pocket = nil
            puts 'Pocket deleted correctly'
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
      operation_node_builder.add_input view: @pocket_name_view
      @operation_node = operation_node_builder.build
    end
  end

  class DepositOP < OperationLeaf

    def build_input_views
      pocket_name_view_builder = InputViewBuilder.new
      pocket_name_view_builder.with_petition "Enter the pocket name"
      pocket_name_view_builder.with_validation method_name: :pocket_name
      pocket_name_view_builder.with_hash key: :name
      @pocket_name_view = pocket_name_view_builder.build
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be deposited"
      amount_view_builder.with_validation method_name: :number
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          pockets_dataset = session.current_user.pockets_dataset
          pocket = pockets_dataset[name: inputed_data[:name]]
          unless pocket.nil?
            pocket.deposit_money(amount: inputed_data[:amount].to_f)
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
      pocket_name_view_builder = InputViewBuilder.new
      pocket_name_view_builder.with_petition "Enter the pocket name"
      pocket_name_view_builder.with_validation method_name: :pocket_name
      pocket_name_view_builder.with_hash key: :name
      @pocket_name_view = pocket_name_view_builder.build
      operation_node_builder = OperationNodeBuilder.new
      operation_node_builder.with_action proc: @action_proc
      operation_node_builder.add_model nodes: navigation_nodes
      operation_node_builder.add_session session: session
      operation_node_builder.add_input view: @pocket_name_view
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class WithdrawalOP < OperationLeaf

    def build_input_views
      pocket_name_view_builder = InputViewBuilder.new
      pocket_name_view_builder.with_petition "Enter the pocket name"
      pocket_name_view_builder.with_validation method_name: :pocket_name
      pocket_name_view_builder.with_hash key: :name
      @pocket_name_view = pocket_name_view_builder.build
      amount_view_builder = InputViewBuilder.new
      amount_view_builder.with_petition "Enter the amount to be withdrawn"
      amount_view_builder.with_validation method_name: :number
      amount_view_builder.with_hash key: :amount
      @amount_view = amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          pockets_dataset = session.current_user.pockets_dataset
          pocket = pockets_dataset[name: inputed_data[:name]]
          unless pocket.nil?
            pocket.withdrawn_money(amount: inputed_data[:amount].to_f)
            puts 'Money withdrawn correctly.'
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
      operation_node_builder.add_input view: @pocket_name_view
      operation_node_builder.add_input view: @amount_view
      @operation_node = operation_node_builder.build
    end
  end

  class SendOP < OperationLeaf

    def build_input_views
      pocket_name_view_builder = InputViewBuilder.new
      pocket_name_view_builder.with_petition "Enter the pocket name"
      pocket_name_view_builder.with_validation method_name: :pocket_name
      pocket_name_view_builder.with_hash key: :name
      @pocket_name_view = pocket_name_view_builder.build
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
          pockets_dataset = session.current_user.pockets_dataset
          pocket = pockets_dataset[name: inputed_data[:name]]
          unless pocket.nil?
            Movement.createTransfer transmitter_account:pocket, amount_money: inputed_data[:amount].to_f, receiver_email: inputed_data[:email]
            puts 'Money sent correctly.'
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
      operation_node_builder.add_input view: @pocket_name_view
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
        user = session.current_user
        accounts = user.pockets
        max = inputed_data[:quantity].to_i
        accounts.each do |account|
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
