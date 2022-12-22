require "./lib/receipt_item_factory.rb"

describe ReceiptItemFactory do
  it "parses an input line" do
    receipt_item =
      ReceiptItemFactory.create_from_stdin(
        "1 imported box of chocolates at 10.00"
      )
    product = receipt_item.product
    expect(receipt_item.quantity).to eq(1)
    expect(product.name).to eq("imported box of chocolates")
    expect(product.price).to be_within(0.01).of(10.00)
  end
end
