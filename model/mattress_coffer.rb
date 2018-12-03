class MattressCoffer < Sequel::Model(DB[:coffers].where(type: Coffer::mattress_type))

    one_to_one :owner
    def deposit_money amount:
        if amount > 0
            account = self.owner.general_account
            account.withdrawn_money(amount: amount, transfer: true)
            coffer = Coffer[self.id]
            coffer.update(amount_money: coffer.amount_money + amount)
        else
            raise 'The amount to be deposit must be positive'
        end
    end

    def withdrawn_money amount:
        if amount > 0
            if self.amount_money >= amount
                Coffer[self.id].update(amount_money: self.amount_money - amount)
                
                account = self.owner.general_account
                account.deposit_money(amount: amount, transfer: true)
            else
                raise 'The mattress does not contain sufficient funds.'
            end
        else
            raise 'The amount to be withdrawn must be positive'
        end
    end
end