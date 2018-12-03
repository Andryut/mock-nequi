class Session

    @@current_user = nil

    def self.current_user= current_user
        @@current_user = current_user
    end

    def self.current_user
        return @@current_user
    end

end