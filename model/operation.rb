class Operation < Sequel::Model

  one_to_one :associated_transaction, class: :Transaction, key_column: :associated_transaction, key: :id
  many_to_one :type, class: :OperationType
  
end