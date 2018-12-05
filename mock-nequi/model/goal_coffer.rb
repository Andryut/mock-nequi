class GoalCoffer < Sequel::Model(DB[:coffers].where(type: Coffer::goal_type).where(active: true))
    
    one_to_one :goal, key: :coffer, reciprocal: :coffer

    def deposit_money amount:
        if amount > 0
            coffer = Coffer[self.id]
            account = User[coffer.owner].general_account
            account.withdrawn_money(amount: amount, transfer: true)
            coffer.update(amount_money: coffer.amount_money + amount)
        else
            raise 'The amount to be deposit must be positive'
        end
    end
    
    def close
        coffer = Coffer[self.id]
        account = User[coffer.owner].general_account
        coffer.update(amount_money: 0, active: false)
        account.deposit_money(amount: self.amount_money, transfer: true)
    end

    def status
        total_amount = self.goal.total_amount

        deadline = self.goal.deadline
        current_time = Time.now
        current_date = Date.new(current_time.year, current_time.month, current_time.day)

        if self.amount_money >= total_amount
            return 'Accomplished'
        elsif current_date > deadline
            return 'Expired'
        else 
            return 'In process'
        end
    end

end