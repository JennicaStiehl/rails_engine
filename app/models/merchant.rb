class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.find_items(params)
    binding.pry
    self.items
  end

  def self.find_merchant(merchant = nil)
    Merchant.all unless merchant != nil
    Merchant.find(merchant.id) unless merchant == nil
  end

  def self.top_revenue(limit = 5, order)
    Merchant.select('merchants.id, merchants.name, sum(invoice_items.unit_price * invoice_items.quantity)as total_revenue')
      .joins(invoices: [:invoice_items, :transactions])
      .where("transactions.result = 'success'")
      .group(:id, :name)
      .order("total_revenue #{order}")
      .limit(limit)
  end

  def self.most_items(limit = 1, order)
  Merchant.select('merchants.id, merchants.name, sum(invoice_items.quantity)as total_sold')
    .joins(invoices: [:invoice_items, :transactions])
    .where("transactions.result = 'success'")
    .group(:id, :name)
    .order("total_sold #{order}")
    .limit(limit)
  end

  def start_date(date)
    date.to_datetime
  end

  def end_date(date)
    (date.to_datetime + 1.days) - 1.second
  end

  def self.revenue_by_date(date)
    Merchant.select('sum(invoice_items.quantity* invoice_items.unit_price)as total_revenue')
      .joins(invoices: [:invoice_items, :transactions])
      .where("transactions.result = 'success' ")
      .where("date_trunc('day', invoices.updated_at)=#{date} ")
      .take
  end
  
  def revenue(order)
    self.select('merchants.id, merchants.name, sum(invoice_items.unit_price * invoice_items.quantity)as total_revenue')
      .joins(invoices: [:invoice_items, :transactions])
      .where("transactions.result = 'success'")
      .group(:id, :name)
      .order("total_revenue #{order}")
  end
  def revenue_by_date(order, date)
    self.select('merchants.id, merchants.name, sum(invoice_items.unit_price * invoice_items.quantity)as total_revenue')
      .joins(invoices: [:invoice_items, :transactions])
      .where("transactions.result = 'success'")
      .where("date_trunc('day', invoices.updated_at)=#{date}")
      .group(:id, :name)
      .order("total_revenue #{order}")
  end

  def favorite_customer
    select('merchants.*, customers.*, count(invoices.id)as total_transactions')
      .joins(invoices: [:transactions, :customer])
      .where("transactions.result = 'success' ")
      .group('merchants.id, customers.id')
      .order('total_transactions desc')
  end

  def customers_with_pending_invoices
    # returns a collection of customers which have pending (unpaid) invoices.
  end
end
