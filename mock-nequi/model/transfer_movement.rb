class TransferMovement < Sequel::Model(DB[:movements].where(type: Movement.transfer_type))
  
  one_to_one :transfer, key: :associated_movement
  
end