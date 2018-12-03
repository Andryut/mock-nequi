class TransactionMovement < Sequel::Model(DB[:movements].where(type: Movement.transaction_type))

  one_to_one :transaction, key: :associated_movement, reciprocal: :associated_movement
  
end