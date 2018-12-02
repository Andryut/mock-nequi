class Account < Sequel::Model

    def self.general_type
      'general'
    end

    def self.pocket_type
      'pocket'
    end

    def self.create_general owner:, name:
      self.create(owner:owner, name: name)
    end

    def self.create_pocket owner:, name:
      self.create(owner:owner, name: name, type: pocket_type)
    end

end