class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attr_reader :name, :id, :created_at, :updated_at
  attributes :name, :id, :created_at, :updated_at
end
