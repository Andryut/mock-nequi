class Transfer < Sequel::Model

  one_to_one :associated_transacction, class: :Transaction
  many_to_one :receiver, class: :User
  
end