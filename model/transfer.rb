class Transfer < Sequel::Model

  one_to_one :associated_transacction, class: :Transaction, key_column: :associated_transaction, key: :id
  many_to_one :receiver, class: :User
  
end