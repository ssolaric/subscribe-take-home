require_relative "round_tax"

class Product
  SALES_TAX = 0.1 # exempt: books, food, medical products
  IMPORT_DUTY_TAX = 0.05 # for imported goods, no exemptions
  # In a real world system, there are some ways to exempt products from a sale tax.
  # If the models were stored in a database, we can have an additional ProductCategory model which
  # has a many-to-one relationship with Product. A given product category can be tax exempt or not
  # and it would decide if a product from this category is tax exempt.
  SALES_TAX_EXEMPTIONS = ["book", "chocolate", "headache pills", "cough syrup"]

  attr_reader :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def sales_tax_exempt?
    SALES_TAX_EXEMPTIONS.any? { |exemption| name.include? exemption }
  end

  def import_duty_tax_exempt?
    !name.start_with?("imported")
  end

  def sales_tax
    round_tax(sales_tax_exempt? ? 0 : SALES_TAX * price)
  end

  def import_duty_tax
    round_tax(import_duty_tax_exempt? ? 0 : IMPORT_DUTY_TAX * price)
  end

  def tax
    sales_tax + import_duty_tax
  end
end
