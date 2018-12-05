module PocketsOperations

  class ListOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        user = session.current_user
        user.refresh
        pocket_accounts = user.pockets

        pocketsReport = PocketsReport.new(element_list: pocket_accounts, limit: pocket_accounts.length)
        pocketsReport.show
      end
    end

  end

  class CreateOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the pocket name"
      pocket_name_view_builder = InputViewBuilder.new petition: petition, field_type: :text, key: :name
      @input_views << pocket_name_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          user.add_pocket(name: inputed_data[:name])
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

  end

  class DeleteOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the name of the pocket that you wish to delete"
      pocket_name_view_builder = InputViewBuilder.new petition: petition, field_type: :text, key: :name
      @input_views << pocket_name_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          pockets_dataset = session.current_user.pockets_dataset
          pocket = pockets_dataset[name: inputed_data[:name]]
          unless pocket.nil?
            pocket.delete
            pocket = nil
          else
            Error.new(message: 'A goal with the entered name was not found') { |error| error.show }
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

      petition = "Enter the pocket name"
      pocket_name_view_builder = InputViewBuilder.new petition: petition, field_type: :text, key: :name
      @input_views << pocket_name_view_builder.build

      petition = "Enter the amount to be deposited"
      amount_view_builder = InputViewBuilder.new petition: petition, field_type: :number, key: :amount
      @input_views << amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          pockets_dataset = session.current_user.pockets_dataset
          pocket = pockets_dataset[name: inputed_data[:name]]
          unless pocket.nil?
            pocket.deposit_money(amount: inputed_data[:amount].to_f)
          else
            Error.new(message: 'A goal with the entered name was not found') { |error| error.show }
          end
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

  end

  class WithdrawalOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the pocket name"
      pocket_name_view_builder = InputViewBuilder.new petition: petition, field_type: :text, key: :name
      @input_views << pocket_name_view_builder.build

      petition = "Enter the amount to be withdrawn"
      amount_view_builder = InputViewBuilder.new petition: petition, field_type: :number, key: :amount
      @input_views << amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          pockets_dataset = session.current_user.pockets_dataset
          pocket = pockets_dataset[name: inputed_data[:name]]
          unless pocket.nil?
            pocket.withdrawn_money(amount: inputed_data[:amount].to_f)
          else
            Error.new(message: 'A goal with the entered name was not found') { |error| error.show }
          end
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

  end

  class SendOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the pocket name"
      pocket_name_view_builder = InputViewBuilder.new petition: petition, field_type: :text, key: :name
      @input_views << pocket_name_view_builder.build

      petition =  "Enter the email of the receiver email"
      email_view_builder = InputViewBuilder.new petition: petition, field_type: :email, key: :email
      @input_views << email_view_builder.build

      petition = "Enter the amount to be sended"
      amount_view_builder = InputViewBuilder.new petition: petition, field_type: :number, key: :amount
      @input_views << amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          pockets_dataset = session.current_user.pockets_dataset
          pocket = pockets_dataset[name: inputed_data[:name]]
          unless pocket.nil?
            Movement.create_transfer transmitter_account:pocket, amount_money: inputed_data[:amount].to_f, receiver_email: inputed_data[:email]
          else
            Error.new(message: 'A goal with the entered name was not found') { |error| error.show }
          end
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end
    
  end

  class CheckTransactionsOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the pocket name"
      pocket_name_view_builder = InputViewBuilder.new petition: petition, field_type: :text, key: :name
      @input_views << pocket_name_view_builder.build

      petition = "Enter the maximum number of transactions you wish see"
      quantity_view_builder = InputViewBuilder.new petition: petition, field_type: :number, key: :quantity
      @input_views << quantity_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        user = session.current_user
        user.refresh
        pocket = user.pockets_dataset[name: inputed_data[:name]]
        max = inputed_data[:quantity].to_i
        transactionReport = TransactionsReport.new(element_list: pocket.transaction_movements, limit: max)
        transactionReport.show
        transferReport = TransfersReport.new(element_list: pocket.transfer_movements, limit: max)
        transferReport.show
      end
    end

  end

end
