require_relative "lib/receipt"
require_relative "lib/receipt_item_factory"

def print_receipt(receipt)
  puts "Output #{receipt.number}:"
  receipt.each { |receipt_item| puts receipt_item }
  puts "Sales Taxes: #{sprintf("%.2f", receipt.total_taxes)}"
  puts "Total: #{sprintf("%.2f", receipt.total_cost)}"
end

first_line = ARGF.gets
input_number = Integer(first_line.delete("^0-9"))
receipt = Receipt.new(number: input_number)

ARGF.each_line do |line|
  receipt_item = ReceiptItemFactory.create_from_stdin(line)
  receipt.add_receipt_item(receipt_item)
end

print_receipt(receipt)
