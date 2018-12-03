class Account < Sequel::Model

    def self.general_type
      'general'
    end

    def self.pocket_type
      'pocket'
    end

    def self.create_general owner_id:, name:
      self.create(owner: owner_id, name: name) #default is general
    end

    def self.create_pocket owner_id:, name:
      begin
        self.create(owner: owner_id, name: name, type: self.pocket_type)
      rescue
        raise 'There is already a pocket with the same name'
      end
    end

end