class GoalCoffer < Sequel::Model(DB[:coffers].where(type: Coffer::goal_type).where(active: true))
    
    many_to_one :owner
    one_to_one :goal, key: :coffer, reciprocal: :coffer
    
    def deposit_money amount:
        if amount > 0
            account = self.owner.general_account
            available_money = account.amount_money
            if available_money >= amount
                Account[account.id].update(amount_money: available_money - amount)
                Coffer[self.id].update(amount_money: self.amount_money + amount)
            else
                raise 'The account does not contain sufficient funds.'
            end
        else
            raise 'The amount to be deposit must be positive'
        end
    end
    
    def close
        account = self.owner.general_account
        available_money = self.amount_money
        Coffer[self.id].update(amount_money: 0, active: false)
        Account[account.id].update(amount_money: account.amount_money + available_money)
    end

    def status
        total_ammount = self.goal.total_ammount
        deadline = self.goal.deadline
        current_time = Time.now
        current_date = Date.new(current_time.year, current_time.month, current_time.day)

        if amount_money >= total_ammount
            return 'Accomplished'
        elsif deadline > current_date
            return 'Expired'
        else 
            return 'In process'
        end
    end

end