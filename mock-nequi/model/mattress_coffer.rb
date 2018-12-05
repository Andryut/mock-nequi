class MattressCoffer < Sequel::Model(DB[:coffers].where(type: Coffer::mattress_type))

    def deposit_money amount:
        if amount > 0
            coffer = Coffer[self.id]
            account = User[coffer.owner].general_account
            account.withdrawn_money(amount: amount, transfer: true)
            coffer.update(amount_money: coffer.amount_money + amount)

            self.amount_money = coffer.amount_money
        else
            raise 'The amount to be deposit must be positive'
        end
    end

    def withdrawn_money amount:
        if amount > 0
            if self.amount_money >= amount
                coffer = Coffer[self.id]
                account = User[coffer.owner].general_account
                coffer.update(amount_money: self.amount_money - amount)
                account.deposit_money(amount: amount, transfer: true)

                self.amount_money = coffer.amount_money
            else
                raise 'The mattress does not contain sufficient funds.'
            end
        else
            raise 'The amount to be withdrawn must be positive'
        end
    end

end