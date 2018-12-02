class TransactionType < Sequel::Model

  one_to_many :transactions, key: :type
  
end