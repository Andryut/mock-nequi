class Movement < Sequel::Model

  def self.transaction_type
    'transaction'
  end

  def self.transfer_type
    'transfer'
  end
  
  def before_create
    raise 'The amount of money must be positive.' unless self.amount_money > 0
    super
  end

  def self.create_transaction transmitter_account_id:, amount_money:, transaction_type:
    movement = self.create(transmitter_account:transmitter_account_id, type: self.transaction_type, amount_money: amount_money)
    Transaction.create(associated_movement: movement.id, type: transaction_type)
  end

  def self.create_transfer transmitter_account:, amount_money:, receiver_email:
    reciever = User[email:receiver_email]

    unless reciever.nil?
      movement = Movement.create(transmitter_account:transmitter_account.id, type: self.transfer_type, amount_money: amount_money)
      Transfer.create(associated_movement:movement.id, reciever: reciever.id)
      transmitter_account.remove_money(amount:amount_money, transfer: true)
      reciever.general_account.deposit_money(amount:amount_money, transfer: true)
    else
      raise 'The entered email has not been found in the system.'
    end
  end

end