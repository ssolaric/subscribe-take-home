class Receipt
  include Enumerable
  attr_reader :number, :total_taxes, :total_cost

  def initialize(number:)
    @number = number
    @total_taxes = 0.0
    @total_cost = 0.0
    @receipt_items = []
  end

  def add_receipt_item(receipt_item)
    @total_taxes += receipt_item.tax
    @total_cost += receipt_item.subtotal
    @receipt_items << receipt_item
  end

  def each(&block)
    @receipt_items.each(&block)
  end
end
