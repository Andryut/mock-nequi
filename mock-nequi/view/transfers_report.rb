class TransferReport < ReportView

    def report
        transfer_movements = element_list
        if transfer_movements.length > 0 and limit > 0
            puts 'TRANSFERS:'
            puts
            count = 0
            transfer_movements.each do |transfer_movement|
                break unless count < limit
                transfer = transfer_movement.transfer
                receiver = User[transfer.receiver]
                puts ' Date: ' + transfer_movement.date.to_s
                puts ' Amount: $%0.2f' % transfer_movement.amount_money
                puts ' Receiver: ' + receiver.email
                puts
                count += 1
            end
        else
            puts 'There are no transfers to show'
        end
    end
    
end