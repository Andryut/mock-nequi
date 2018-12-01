class Transaction < Sequel::Model
  def self.operation
    'operation'
  end
  def self.transfer 
    'transfer'
  end
end