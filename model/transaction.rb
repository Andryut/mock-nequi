class Transaction < Sequel::Model

  def self.entry_type
    'entry'
  end

  def self.withdrawal_type
    'withdrawal'
  end
  
end