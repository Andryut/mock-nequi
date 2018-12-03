class GoalCoffer < Sequel::Model(DB[:coffers].where(type: Coffer::goal_type).where(active: true))
    
    many_to_one :owner
    one_to_one :goal, key: :coffer, reciprocal: :coffer

    def deposit_money amount:
        if amount > 0
            account = self.owner.general_account
            account.withdrawn_money(ammount: amount, transfer: true)

            coffer = Coffer[self.id]
            coffer.update(amount_money: coffer.amount_money + amount)

            self.owner.refresh
        else
            raise 'The amount to be deposit must be positive'
        end
    end
    
    def close
        account = self.owner.general_account

        Coffer[self.id].update(amount_money: 0, active: false)
        account.deposit_money(ammount: self.amount_money, transfer: true)

        self.owner.refresh
    end

    def status
        total_ammount = self.goal.total_ammount

        deadline = self.goal.deadline
        current_time = Time.now
        current_date = Date.new(current_time.year, current_time.month, current_time.day)

        if self.amount_money >= total_ammount
            return 'Accomplished'
        elsif deadline > current_date
            return 'Expired'
        else 
            return 'In process'
        end
    end

end