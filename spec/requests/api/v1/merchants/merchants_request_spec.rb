require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
    merchants = JSON.parse(response.body)

    # expect(merchants.count).to eq(3)
  end
  it "can show one resource" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants["data"]["attributes"]["id"]).to eq(id)
  end
  it "can find by name" do
    name = create(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"
    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants["data"]["attributes"]["name"]).to eq(name)
  end
  it "can find by created at" do
    created_at = "2012-03-27T14:54:05.000Z"
    m1 = Merchant.create(name: "merchant1", updated_at:  "2012-03-27T14:54:05.000Z", created_at: "2012-03-27T14:54:05.000Z" )
    m2 = Merchant.create(name: "merchant2", updated_at:  "2012-04-27T14:54:05.000Z", created_at: "2012-04-27T14:54:05.000Z" )
    get "/api/v1/merchants/find?created_at=#{created_at}"

    merchants = JSON.parse(response.body)
    # binding.pry
    expect(response).to be_successful

    expect(merchants["data"]["attributes"]["created_at"]).to eq(created_at)
    expect(merchants["data"]["attributes"]["created_at"]).to_not eq(m2.created_at)
  end


end
