require "./lib/receipt_item.rb"

describe ReceiptItem do
  let!(:product) do
    Product.new(name: "imported boxes of chocolates", price: 11.25)
  end
  let!(:receipt_item) { ReceiptItem.new(product: product, quantity: 3) }

  it "computes total tax" do
    expect(receipt_item.tax).to be_within(0.01).of(1.80)
  end

  it "computes a subtotal" do
    expect(receipt_item.subtotal).to be_within(0.01).of(35.55)
  end
end
