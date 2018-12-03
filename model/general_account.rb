class GeneralAccount < Sequel::Model(DB[:accounts].where(type: Account::general_type).where(active: true));

  one_to_one :owner
  one_to_many :transaction_movements, key: :transmitter_account, read_only: true
  one_to_many :transfer_movements, key: :transmitter_account, read_only: true

  def deposit_money amount:, transfer: false
    if amount > 0
      account = Account[self.id]
      account.update(amount_money: account.amount_money + amount)
      unless transfer
        Movement.create_transaction transmitter_account_id: self.id, amount_money: amount, transaction_type: Transaction::entry_type
      end
    else
      raise 'The amount to be deposit must be positive'
    end
  end

  def withdrawn_money amount:, transfer: false
    if amount > 0
      account = Account[self.id]
      amount_money = account.amount_money
      if amount_money >= amount
        account.update(amount_money: amount_money - amount)
      else
        raise 'The account does not contain sufficient funds.'
      end
      unless transfer
        Movement.create_transaction transmitter_account_id: self.id, amount_money: amount, transaction_type: Transaction::entry_type
      end
    else
      raise 'The amount to be withdrawn must be positive'
    end
  end

end