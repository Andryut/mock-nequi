class Movement < Sequel::Model

  def self.transaction_type
    'transaction'
  end

  def self.transfer_type
    'transfer'
  end
  
  def self.create_transaction transmitter_account:, amount_money:, transaction_type:

    raise 'The amount to be deposit must be positive' unless amount_money > 0

    movement = self.create(transmitter_account:transmitter_account, type: transaction_type, amount_money: amount_money)
    Transaction.create(associated_movement: movement.id, type: transaction_type)
  end

  def self.create_transfer transmitter_account:, amount_money:, receiver_email:
    reciever = User[email:receiver_email].first

    raise 'The entered email has not been found in the system.' if(reciever.nil?)

    movement = self.create(transmitter_account:transmitter_account, type: transfer_type, amount_money: amount_money)

  end

end