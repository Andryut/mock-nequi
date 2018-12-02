class MattressCoffer < Sequel::Model(DB[:coffers].where(type: Coffer::mattress_type))

    one_to_one :owner, class: :User, key_column: :owner, key: :id
    
end