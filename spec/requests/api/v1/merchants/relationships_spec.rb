require 'rails_helper'

describe "Merchants API" do
  it "returns a list of merchant items" do
    #returns a collection of items associated with that merchant
    m1 = create(:merchant)
    item1 = m1.items.create(name: "item1")
    item2 = m1.items.create(name: "item2")
    get "/api/v1/merchants/#{m1.id}/items"
    expect(response).to be_successful
    merchant_items = JSON.parse(response.body)

    expect(merchant_items["data"]["attributes"]["items"].count).to eq(2)
  end

  it "returns merchant invoices" do
# returns a collection of invoices associated with that merchant from their known orders
    m1 = Merchant.create(name:"m1")
    c1 = Customer.create(first_name: "jim", last_name: "stiehl")
    c2 = Customer.create(first_name: "john", last_name: "stiehl")
    i1 = Invoice.create(customer_id: c2.id, status:"shipped", merchant_id: m1.id)
    i2 = Invoice.create(customer_id: c1.id, status:"shipped", merchant_id: m1.id)
    # m1.invoices << i2
    get "/api/v1/merchants/#{m1.id}/invoices"

    expect(response).to be_successful
    merchant_invoices = JSON.parse(response.body)

    expect(merchant_invoices["data"]["attributes"]["invoices"].count).to eq(2)
  end
end
