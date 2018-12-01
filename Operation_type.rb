class Operation_type < Sequel::Model
  one_to_many :operations, key: :type
end