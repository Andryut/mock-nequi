class Transaction < Sequel::Model

  one_to_one :associated_movement, class: :Transaction, key_column: :associated_movement, key: :id
  many_to_one :type, class: :TransactionType
  
end