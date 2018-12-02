class Coffer < Sequel::Model

    def self.mattress_type
        'mattress'
    end

    def self.goal_type 
        'goal'
    end

    def self.create_mattress owner:, name:
        self.create(owner:owner, name: name)
    end

    def self.create_goal owner:, name:, total_amount:, duration_in_days:
        if total_amount > 0 and  duration_in_days >0
            coffer = self.create(owner:owner, name: name, type: goal_type)
    
            current_date = Time.now
            deadline = Date.new(current_date.year, current_date.month, current_date.day) + duration_in_days
            
            Goal.create(coffer: coffer.id, total_amount: total_amount, deadline: deadline)
        else
            raise 'total_amount must be a positive amount' if total_amount <= 0
            raise 'duration_in_days must be a positive amount' if duration_in_days <= 0
        end
    end
    
end