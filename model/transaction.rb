class Transaction < Sequel::Model

  one_to_one :associated_movement, class: :Transaction, key_column: :associated_movement, key: :id

  def self.entry_type
    'entry'
  end

  def self.withdrawal_type
    'withdrawal'
  end
  
end