class Coffer < Sequel::Model

    one_to_one :owner, class: :User

    def self.mattress_type
        'mattress'
    end

    def self.goal_type 
        'goal'
    end

    def self.create_mattress owner:
        self.create(owner:owner, type: mattress_type)
    end

    def self.create_goal owner:, name:, total_amount:, duration_in_days:
        coffer = self.create(owner:owner, type: goal_type)

        current_date = Time.now
        deadline = Date.new(current_date.year, current_date.month, current_date.day) + duration_in_days
        
        Goal.create(coffer: coffer.id, name: name, total_amount: total_amount,  deadline: deadline)
    end
    
end