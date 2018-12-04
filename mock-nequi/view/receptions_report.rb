class ReceptionsReport < ReportView

    def report
        receptions = element_list
        if receptions.length > 0 and limit > 0
            puts 'RECEPTIONS:'
            puts
            count = 0
            receptions.each do |transfer|
                break unless count < limit
                transfer_movement = Movement[transfer.associated_movement]
                transmitter_account = Account[transfer_movement.transmitter_account]
                transmitter_user = User[transmitter_account.owner]
                puts ' Date: ' + transfer_movement.date.to_s
                puts ' Amount: $%0.2f' % transfer_movement.amount_money
                puts ' Transmitter: ' + transmitter_user.name
                puts ' Transmitter email: ' + transmitter_user.email
                puts
                count += 1
            end
        else
            puts 'There are no transactions to show'
        end
    end

end