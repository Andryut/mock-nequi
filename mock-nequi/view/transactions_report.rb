class TransactionsReport < ReportView

    def report
        transaction_movements = element_list
        if transaction_movements.length > 0 and limit > 0
            puts 'TRANSACTIONS:'
            puts
            count = 0
            transaction_movements.each do |transaction_movement|
                break unless count < limit
                transaction = transaction_movement.transaction
                puts ' Date: ' + transaction_movement.date.to_s
                puts ' Amount: $%0.2f' % transaction_movement.amount_money
                puts ' Transaction type: ' + transaction.type
                puts
                count += 1
            end
        else
            puts 'There are no transactions to show'
        end
    end

end