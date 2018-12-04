class PocketsReport < ReportView

    def report
        pocket_accounts = element_list
        if pocket_accounts.length > 0 and limit > 0
            puts 'POCKETS:'
            puts
            count = 0
            pocket_accounts.each do |pocket_account|
                break unless count < limit
                puts 'Name: ' + pocket_account.name
                puts 'Balance: $%0.2f' % pocket_account.amount_money
                puts
                count += 1
            end
        else
            puts 'There are no pockets to show'
        end
    end

end