class General_account < Sequel::Model(DB[:accounts].where(type:Account::general_account));
  one_to_one :owner, class: :User
  one_to_many :operation_transactions, key: :transmitter_account, read_only: true
  one_to_many :transfer_transactions, key: :transmitter_account, read_only: true

  def deposit_money amount:
    account = Account[self.id]
    account.update(amount_money: account.amount_money + amount)
  end
  def remove_money amount:
    account = Account[self.id]
    amount_money = account.amount_money
    if amount_money >= amount
      account.update(amount_money: amount_money - amount)
      return true
    else
      return false
    end
  end
end