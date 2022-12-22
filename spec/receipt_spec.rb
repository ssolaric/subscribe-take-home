require "./lib/receipt.rb"

describe Receipt do
  it "computes total taxes a cost of four items" do
    receipt = Receipt.new(number: 123)
    receipt_item1 =
      ReceiptItem.new(
        product: Product.new(name: "imported bottle of perfume", price: 27.99),
        quantity: 1
      )
    receipt_item2 =
      ReceiptItem.new(
        product: Product.new(name: "bottle of perfume", price: 18.99),
        quantity: 1
      )
    receipt_item3 =
      ReceiptItem.new(
        product: Product.new(name: "packet of headache pills", price: 9.75),
        quantity: 1
      )
    receipt_item4 =
      ReceiptItem.new(
        product: Product.new(name: "imported box of chocolates", price: 11.25),
        quantity: 3
      )
    receipt.add_receipt_item(receipt_item1)
    receipt.add_receipt_item(receipt_item2)
    receipt.add_receipt_item(receipt_item3)
    receipt.add_receipt_item(receipt_item4)

    expect(receipt.total_taxes).to be_within(0.01).of(7.90)
    expect(receipt.total_cost).to be_within(0.01).of(98.38)
  end
end
