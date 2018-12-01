class Operation_transaction < Sequel::Model(DB[:transactions].where(type: Transaction.operation))
  one_to_one :operation, key: :associated_transaction
end