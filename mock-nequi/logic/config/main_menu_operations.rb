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

  end

  class CheckTotalOP < OperationLeaf

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        puts '$%0.2f' % session.current_user.total_money
        puts 'Press enter to continue'
        gets
      end
    end

  end

  class DepositOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the amount to be deposited"
      amount_view_builder = InputViewBuilder.new petition: petition , field_type: :number, key: :amount
      @input_views << amount_view_builder.build
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
          account = user.general_account
          account.withdrawn_money(amount: inputed_data[:amount].to_f)
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

  end

  class SendOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the email of the receiver email"
      email_view_builder = InputViewBuilder.new petition: petition, field_type: :email, key: :email
      @input_views << email_view_builder.build
      
      petition = "Enter the amount to be sended"
      amount_view_builder = InputViewBuilder.new petition: petition, field_type: :number, key: :amount
      @input_views << amount_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        begin
          user = session.current_user
          account = user.general_account
          Movement.create_transfer transmitter_account:account, amount_money: inputed_data[:amount].to_f, receiver_email: inputed_data[:email]
        rescue => exception
          Error.new(message: exception.message) { |error| error.show }
        end
      end
    end

  end

  class CheckTransactionsOP < OperationLeaf

    def build_input_views
      @input_views = Array.new

      petition = "Enter the maximum number of transactions you wish see"
      quantity_view_builder = InputViewBuilder.new petition: petition, field_type: :number, key: :quantity
      @input_views << quantity_view_builder.build
    end

    def setup_action
      @action_proc = Proc.new do |inputed_data, session|
        user = session.current_user
        user.refresh
        account = user.general_account
        max = inputed_data[:quantity].to_i
        transactionsReport = TransactionsReport.new(element_list: account.transaction_movements, limit: max)
        transactionsReport.show
        transfersReport = TransfersReport.new(element_list: account.transfer_movements, limit: max)
        transfersReport.show
        receptionsReport = ReceptionsReport.new(element_list: user.receptions, limit: max)
        receptionsReport.show
      end
    end

  end
end
