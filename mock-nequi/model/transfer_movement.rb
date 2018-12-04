class TransferMovement < Sequel::Model(DB[:movements].where(type: Movement.transfer_type))
  
  one_to_one :transfer, class: :Transfer, key: :associated_movement
  
end