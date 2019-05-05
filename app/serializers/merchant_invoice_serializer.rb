class MerchantInvoiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id, :invoices
end
