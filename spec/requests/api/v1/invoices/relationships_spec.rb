require 'rails_helper'
describe 'invoices API' do
  it "can return a collection of associated transactions" do
    m1 = Merchant.create(name:"m1")
    c1 = Customer.create(first_name: "jim", last_name: "stiehl")
    c2 = Customer.create(first_name: "john", last_name: "stiehl")
    i1 = Invoice.create(customer_id: c2.id, status:"shipped", merchant_id: m1.id)
    t1 = Transaction.create!(invoice_id: i1.id, result: "success")
    t2 = Transaction.create!(invoice_id: i1.id, result: "success")
    get "/api/v1/invoices/#{i1.id}/transactions"

    expect(response).to be_successful
    invoice_transactions = JSON.parse(response.body)

    expect(invoice_transactions["data"]["attributes"]["transactions"].count).to eq(2)
  end
end
