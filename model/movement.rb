class Movement < Sequel::Model

  def self.transaction_type
    'transaction'
  end

  def self.transfer_type
    'transfer'
  end
  
  def self.create_transaction owner:, name:
    self.create(owner:owner, name: name)
  end

  def self.create_transfer owner:, name:
    self.create(owner:owner, name: name, type: pocket_type)
  end

end