require "./lib/round_tax.rb"

describe "#round_tax" do
  describe "a regular national product" do
    it "rounds up sales tax to the nearest 0.05" do
      expect(round_tax(4.26)).to be_within(0.01).of(4.30)
      expect(round_tax(4.30)).to be_within(0.01).of(4.30)
      expect(round_tax(4.31)).to be_within(0.01).of(4.35)
      expect(round_tax(4.35)).to be_within(0.01).of(4.35)
    end
  end
end
