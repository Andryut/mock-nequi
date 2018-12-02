class Mattress < Sequel::Model(DB[:coffer].where(type: Coffer.mattress_type))

    one_to_one :owner, class: :User
    
end