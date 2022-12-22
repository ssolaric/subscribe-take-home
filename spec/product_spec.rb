require "./lib/product.rb"

describe Product do
  describe "a national product" do
    let!(:product) { Product.new(name: "music CD", price: 42.66) }

    it "is not exempt from sales tax" do
      expect(product.sales_tax_exempt?).to be(false)
      expect(product.sales_tax).to be_within(0.01).of(4.30)
    end

    it "is exempt from import duty tax" do
      expect(product.import_duty_tax_exempt?).to be(true)
      expect(product.import_duty_tax).to be_within(0.01).of(0.0)
    end
  end

  describe "a medical imported product" do
    let!(:product) { Product.new(name: "imported cough syrup", price: 1.23) }

    it "is exempt from sales tax" do
      expect(product.sales_tax_exempt?).to be(true)
      expect(product.sales_tax).to be_within(0.01).of(0.0)
    end

    it "is not exempt from import duty tax" do
      expect(product.import_duty_tax_exempt?).to be(false)
      expect(product.import_duty_tax).to be_within(0.01).of(0.10)
    end
  end
end
