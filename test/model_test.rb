puts 'conecting to database...'
require File.join(__dir__, '../connection', 'connection.rb')
puts 'loading packages...'
require File.join(__dir__, '../model', 'user.rb')
require File.join(__dir__, '../model', 'account.rb')
require File.join(__dir__, '../model', 'general_account.rb')
require File.join(__dir__, '../model', 'pocket_account.rb')
require File.join(__dir__, '../model', 'movement.rb')
require File.join(__dir__, '../model', 'transfer_movement.rb')
require File.join(__dir__, '../model', 'transaction_movement.rb')
require File.join(__dir__, '../model', 'transaction.rb')
require File.join(__dir__, '../model', 'transfer.rb')
require File.join(__dir__, '../model', 'coffer.rb')
require File.join(__dir__, '../model', 'mattress_coffer.rb')
require File.join(__dir__, '../model', 'goal_coffer.rb')
require File.join(__dir__, '../model', 'goal.rb')
puts 'done'
begin
    User.create(name:'', email: '1', password:'pepe')
rescue RuntimeError => e
    puts e.message
end
begin
    User[email: 1].mattress.deposit_money(amount: 10)
rescue RuntimeError => e
    puts e.message
end
begin 
    puts User.login(email:'1', password:'pepe').values
rescue RuntimeError => e
    puts e.message
end