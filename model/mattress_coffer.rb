class MattressCoffer < Sequel::Model(DB[:coffers].where(type: Coffer::mattress_type))

    one_to_one :owner
    
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

    def withdrawn_money amount:
        if amount > 0
            if self.amount_money >= amount
                account = self.owner.general_account
                Coffer[self.id].update(amount_money: self.amount_money - amount)
                Account[account.id].update(amount_money: account.amount_money + amount)
            else
                raise 'The mattress does not contain sufficient funds.'
            end
        else
            raise 'The amount to be withdrawn must be positive'
        end
    end
end