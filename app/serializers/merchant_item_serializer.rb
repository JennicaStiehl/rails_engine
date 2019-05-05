class MerchantItemSerializer
  include FastJsonapi::ObjectSerializer
  attr_reader :name, :id, :items
  attributes :name, :id, :items
end
