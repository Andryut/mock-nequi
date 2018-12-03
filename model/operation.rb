class Operation < Sequel::Model
  one_to_one :associated_transaction, class: :Transaction
  many_to_one :type, class: :OperationType
end