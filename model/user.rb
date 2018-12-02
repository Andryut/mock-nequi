class User < Sequel::Model

    one_to_one :general_account, key: :owner, read_only: true
    one_to_one :mattress, class: :MattressCoffer, key: :owner, read_only: true
    one_to_many :pockets, class: :PocketAccount, key: :owner, read_only: true
    one_to_many :goals, class: :GoalCoffer, key: :owner, read_only: true
    one_to_many :receptions, class: :Transfer, key: :receiver

  
    def self.login email:, password:
      user = User.where(email: email).first
      return nil if user.nil?
      return nil if user.password != password
      return user
    end
  
    def after_create
      Account.create_general(owner:self.id)
      Coffer.create_mattress(owner:self.id, name: self.name + ' - account')
      super
    end
    
    def add_goal name:, total_amount:, duration_in_days:
      Coffer.create_goal(owner:self.id, name: name, total_amount: total_amount, duration_in_days: duration_in_days)
    end

    def add_pocket name:
      Account.create_pocket(owner: self.id, name: name)
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

    def close_goal goalCoffer:
      amount_money = goalCoffer.amount_money
      
      coffer = Coffer[goalCoffer.id]
      coffer.update(active: false)

      self.general_account.deposit_money amount: amount_money

      goalCoffer = nil
    end

end