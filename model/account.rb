class Account < Sequel::Model

    def self.general_type
      'general'
    end

    def self.pocket_type
      'pocket'
    end

    def self.create_general owner:
      self.create(owner:owner, type: general_type)
    end

    def self.create_pocket owner:
      self.create(owner:owner, type: pocket_type)
    end

end