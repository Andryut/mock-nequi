class GoalCoffer < Sequel::Model(DB[:coffers].where(type: Coffer::goal_type))
    
    one_to_one :owner, class: :User, key_column: :owner, key: :id
    one_to_one :goal, key: :coffer
    
end