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
            begin
                coffer = self.create(owner:owner, name: name, type: goal_type)
        
                current_date = Time.now
                deadline = Date.new(current_date.year, current_date.month, current_date.day) + duration_in_days
                
                Goal.create(coffer: coffer.id, total_amount: total_amount, deadline: deadline)
            rescue
                raise 'There is already a goal with the same name.'
            end
        else
            raise 'The total amount must be positive.' unless total_amount > 0
            raise 'The duration of the goal must be positive.' unless duration_in_days > 0
        end
    end
    
end