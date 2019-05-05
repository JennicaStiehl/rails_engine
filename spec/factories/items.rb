FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    unit_price { "MyString" }
    merchant { nil }
  end
end
