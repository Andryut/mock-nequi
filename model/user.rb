class User < Sequel::Model

    one_to_one :general_account, key: :owner, read_only: true
    one_to_one :mattress, key: :owner, read_only: true
    one_to_many :pockets, class: :PocketAccount, key: :owner, read_only: true

    one_to_many :receptions, class: :Transfer, key: :receiver

  
    def self.login email:, password:
      user = User.where(email: email).first
      return nil if user.nil?
      return nil if user.password != password
      return user
    end
  
    def after_create
      Account.create_general(owner:self.id)
      super
    end
  
    def add_pocket
      Account.create_pocket(owner: self.id)
    end
    
    def total

    end 

    def remove_pocket pocket:
      amount_money = pocket.amount_money
      
      account = Account[pocket.id]
      account.update(active: false)

      self.general_account.deposit_money amount: amount_money

      pocket = nil
    end

end