require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "#instance  methods" do
    it "can get the start date" do
      date_one = "2012-03-16"
      date_two = "2012-03-07"
      m1 = Merchant.new(name: "m1")
      actual = m1.start_date(date_one)
      expect(actual).to eq("2012-03-16 00:00:00")
    end
    it "can get the end date" do
      date_one = "2012-03-16"
      date_two = "2012-03-07"
      m1 = Merchant.new(name: "m1")
      actual = m1.end_date(date_one)
      expect(actual).to eq("Fri, 16 Mar 2012 23:59:59.000000000 +0000")
    end
    it "can find a merchant with a parameter" do
      m1 = Merchant.create(name:"m1")
      actual = Merchant.find_merchant(m1)
      expect(actual).to eq(m1)
    end
    xit "can find all merchants without a parameter" do
      m1 = Merchant.create(name:"m1")
      m2 = Merchant.create(name:"m2")
      m3 = Merchant.create(name:"m3")
      actual = Merchant.find_merchant
      expect(actual).to eq([m1,m2,m3])
    end
    it "can find revenue for one merchant" do
      m1 = Merchant.create(name:"m1")
      c1 = Customer.create(first_name: "jim", last_name: "stiehl")
      c2 = Customer.create(first_name: "john", last_name: "stiehl")
      item1 = m1.items.create!(name:"thing1", unit_price: 10, description: "dynamite")
      item2 = m1.items.create!(name:"thing2", unit_price: 10, description: "dynamite")
      item3 = m1.items.create!(name:"thing3", unit_price: 10, description: "dynamite")
      i1 = Invoice.create!(customer_id: c2.id, status:"shipped", merchant_id: m1.id)
      ii1 = InvoiceItem.create!(item_id: item1.id, invoice_id: i1.id, quantity: 2, unit_price: 10)
      ii2 = InvoiceItem.create!(item_id: item2.id, invoice_id: i1.id, quantity: 2, unit_price: 10)
      ii3 = InvoiceItem.create!(item_id: item3.id, invoice_id: i1.id, quantity: 2, unit_price: 10)
      t1 = Transaction.create!(invoice_id: i1.id, result: "success")
      t2 = Transaction.create!(invoice_id: i1.id, result: "success")
      actual = m1.revenue
      expect(actual).to eq(60)
    end
  end
end
