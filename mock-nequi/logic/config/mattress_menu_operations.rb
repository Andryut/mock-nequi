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
