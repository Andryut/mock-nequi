class TransactionMovement < Sequel::Model(DB[:movements].where(type: Movement.transaction_type))

  one_to_one :transaction, key: :associated_movement
  
end