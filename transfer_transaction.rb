class TransferTransaction < Sequel::Model(DB[:transactions].where(type: Transaction.transfer))
  one_to_one :transfer, key: :associated_transaction
  
end