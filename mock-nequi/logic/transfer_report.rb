class TransferReport < ReportView

    def report
        transfer_movements = element_list
        if transfer_movements.length > 0 and limit > 0
            puts 'TRANSFERS:'
        else
            puts 'There are no transfers to show'
        end
        puts
        count = 0
        transfer_movements.each do |transfer_movement|
            break unless count < limit
            transfer = transfer_movement.transfer
            puts ' Date: ' + transaction_movement.date.to_s
            puts ' Amount: $%0.2f' % transaction_movement.amount_money
            puts ' Receiver ' + transfer.receiver.email
            puts
            count += 1
        end
    end
    
end