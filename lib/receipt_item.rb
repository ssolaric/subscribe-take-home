class ReceiptItem
  attr_reader :product, :quantity

  def initialize(product:, quantity:)
    @product = product
    @quantity = quantity
  end

  def tax
    product.tax * quantity
  end

  def subtotal
    product.price * quantity + tax
  end

  def to_s
    "#{quantity} #{product.name}: #{sprintf("%.2f", subtotal)}"
  end
end
