class GoalsReport < ReportView

    def report
        goal_coffers = element_list
        if goal_coffers.length > 0 and limit > 0
            puts 'GOALS:'
            puts
            count = 0
            goal_coffers.each do |goal_coffer|
                break unless count < limit
                goal = goal_coffer.goal
                puts 'Name: ' + goal_coffer.name
                puts 'Total amount: $%0.2f' % goal.total_amount.to_f
                puts 'Saved money: $%0.2f' % goal_coffer.amount_money.to_f
                puts 'Remaining money: $%0.2f' % (goal.total_amount.to_f - goal_coffer.amount_money.to_f)
                puts 'Status: ' + goal_coffer.status
                puts 'Deadline: ' + goal.deadline.to_s
                puts
                count += 1
            end
        else
            puts 'There are no goals to show'
        end
    end

end