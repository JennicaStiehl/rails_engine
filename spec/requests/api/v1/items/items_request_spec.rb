require 'rails_helper'

describe "Items API" do
  xit "sends a list of items" do
    create_list(:merchant,3)
    # create_list(:item, 3, merchant)

    get '/api/v1/items'

    expect(response).to be_successful
    # merchants = JSON.parse(response.body)
    #
    # expect(merchants.count).to eq(3)
  end
end
