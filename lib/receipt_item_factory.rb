require_relative "product"
require_relative "receipt_item"

class ReceiptItemFactory
  def self.create_from_stdin(line)
    pattern = /^(\d+) (.*) at (.*)$/
    quantity, product_name, price = line.scan(pattern).first
    product = Product.new(name: product_name, price: Float(price))
    receipt_item = ReceiptItem.new(product: product, quantity: Integer(quantity))
    receipt_item
  end
end
