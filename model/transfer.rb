class Transfer < Sequel::Model

  one_to_one :associated_movement
  many_to_one :receiver
  
end