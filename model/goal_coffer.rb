class GoalCoffer < Sequel::Model(DB[:coffer].where(type: Coffer.goal_type))

    one_to_one :owner, class: :User
    one_to_one :goal, key: :coffer
    
end