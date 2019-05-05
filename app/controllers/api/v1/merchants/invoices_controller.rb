class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    # binding.pry
    render json: MerchantInvoiceSerializer.new(Merchant.find(params[:id]))
  end
end
