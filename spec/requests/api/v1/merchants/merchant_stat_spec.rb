require 'rails_helper'

describe "Merchants API" do
  before :each do
    @m1 = Merchant.create(name: "M1")
    @m2 = Merchant.create(name: "M2")
    @m3 = Merchant.create(name: "M3")
    @c1 = Customer.create(first_name: "C1")
    @c2 = Customer.create(first_name: "C2")
    @c3 = Customer.create(first_name: "C3")
    @item1 = @m1.items.create(name: "item1", unit_price: 5)
    @item2 = @m1.items.create(name: "item2", unit_price: 5)
    @item3 = @m2.items.create(name: "item3", unit_price: 5)
    @item4 = @m2.items.create(name: "item4", unit_price: 5)
    @item5 = @m3.items.create(name: "item5", unit_price: 5)
    @item5 = @m3.items.create(name: "item6", unit_price: 5)
    @i1 = Invoice.create(customer_id: @c1, merchant_id: @m1)
    @i2 = Invoice.create(customer_id: @c1, merchant_id: @m2)
    @i3 = Invoice.create(customer_id: @c1, merchant_id: @m2)
    @i4 = Invoice.create(customer_id: @c1, merchant_id: @m3)
    @i5 = Invoice.create(customer_id: @c1, merchant_id: @m2)
    @i6 = Invoice.create(customer_id: @c1, merchant_id: @m1)
    # @ii1 = @item1.invoice_items.create(invoice_id: @)
  end

  xit "can find merchant with the most revenue" do

    GET "/api/v1/merchants/most_revenue?quantity=x"

    merchants = JSON.parse(response.body)
    expect(merchants.top_revenue(3,'desc')).to have_content()
    #returns the top x merchants ranked by total revenue
  end
end
