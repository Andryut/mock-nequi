class Coffer < Sequel::Model

    def self.mattress_type
      'mattress'
    end

    def self.goal_type 
      'goal'
    end

    def self.create_mattress owner:
      self.create(owner:owner, type: mattress_type)
    end

    def self.create_goal owner:
      self.create(owner:owner, type: goal_type)
    end
    
end