class Movement < Sequel::Model

  def self.transaction_type
    'transaction'
  end

  def self.transfer_type
    'transfer'
  end
  
end