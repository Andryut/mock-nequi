require File.join(__dir__, '../connection', 'connection.rb')

require File.join(__dir__, '../model', 'user.rb')
require File.join(__dir__, '../model', 'account.rb')
require File.join(__dir__, '../model', 'general_account.rb')
require File.join(__dir__, '../model', 'pocket_account.rb')
require File.join(__dir__, '../model', 'transaction.rb')
require File.join(__dir__, '../model', 'transfer_transaction.rb')
require File.join(__dir__, '../model', 'operation_transaction.rb')
require File.join(__dir__, '../model', 'operation_type.rb')
require File.join(__dir__, '../model', 'operation.rb')
require File.join(__dir__, '../model', 'transfer.rb')
require File.join(__dir__, '../model', 'coffer.rb')
require File.join(__dir__, '../model', 'mattress_coffer.rb')
require File.join(__dir__, '../model', 'goal_coffer.rb')
require File.join(__dir__, '../model', 'goal.rb')

puts GeneralAccount.first.owner.mattress.values