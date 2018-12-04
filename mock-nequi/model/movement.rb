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
    receiver = User[email:receiver_email]
    unless receiver.nil?
      owner_user = transmitter_account.owner
      unless  receiver.email == owner_user.email
        movement = Movement.create(transmitter_account:transmitter_account.id, type: self.transfer_type, amount_money: amount_money)
        Transfer.create(associated_movement:movement.id, receiver: receiver.id)
        transmitter_account.withdrawn_money(amount:amount_money, transfer: true)
        receiver.general_account.deposit_money(amount:amount_money, transfer: true)
      else
        raise 'You can not send money to yourself.'
      end
    else
      raise 'The entered email has not been found in the system.'
    end
  end

end