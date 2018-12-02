class TransferTransaction < Sequel::Model(DB[:movements].where(type: Movement.transfer_type))
  
  one_to_one :transaction, key: :associated_movement
  
end