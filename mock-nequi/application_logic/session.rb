class Session

    attr_reader :current_user

    def initialize
        @current_user = User.default_user
    end

    def login email:, password:
        @current_user = User.login email: email, password: password
    end

    def create_and_login name:, email:, password:
        @current_user = User.create name: name, email: email, password: password
    end

    def sign_off
        @current_user = User.default_user
    end

end