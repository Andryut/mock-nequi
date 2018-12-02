class Account < Sequel::Model

    def self.general_account
      'general_account'
    end

    def self.pocket 
      'pocket'
    end

    def self.create_general_account owner:
      self.create(owner:owner, type: general_account)
    end

    def self.create_pocket owner:
      self.create(owner:owner, type: pocket)
    end
    
end