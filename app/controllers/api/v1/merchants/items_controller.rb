class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    render json: MerchantItemSerializer.new(Merchant.find_by(params[:merchant_id]))
  end
end
