FactoryBot.define do
  factory :transaction do
    invoice { nil }
    credit_card_number { "MyString" }
    integer { "MyString" }
    credit_card_expiration_date { "MyString" }
    date { "MyString" }
    result { "MyString" }
  end
end
