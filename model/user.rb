require 'digest'

class User < Sequel::Model

    one_to_one :general_account, key: :owner, read_only: true, reciprocal: :owner
    one_to_one :mattress, class: :MattressCoffer, key: :owner, read_only: true, reciprocal: :owner
    one_to_many :pockets, class: :PocketAccount, key: :owner, read_only: true, reciprocal: :owner
    one_to_many :goals, class: :GoalCoffer, key: :owner, read_only: true, reciprocal: :owner
    one_to_many :receptions, class: :Transfer, key: :receiver, reciprocal: :receiver

  
    def self.login email:, password:

      user = User[email: email]
      raise 'The email entered is incorrect.' if user.nil?

      sha2 = Digest::SHA2.new
      sha2.update password + user.salt.to_s

      raise 'The password entered is incorrect.' unless user.password == sha2.hexdigest

      return user
    end

    def before_create
      raise 'Mail is not available.' unless User[email: self.email].nil?

      Random.new_seed
      salt_generator = Random.new

      self.salt = salt_generator.rand(1000000)
      
      sha2 = Digest::SHA2.new
      sha2.update self.password + self.salt.to_s
      self.password = sha2.hexdigest

      super
    end

    def after_create
      Account.create_general(owner:self.id, name: self.name + ' - general')
      Coffer.create_mattress(owner:self.id, name: self.name + ' - mattress')
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

      self.general_account.deposit_money amount: amount_money, transfer: true

      pocket = nil
    end

    def close_goal goalCoffer:
      amount_money = goalCoffer.amount_money
      
      coffer = Coffer[goalCoffer.id]
      coffer.update(active: false)

      self.general_account.deposit_money amount: amount_money, transfer: true

      goalCoffer = nil
    end

    private

end