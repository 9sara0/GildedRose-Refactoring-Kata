require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end
end




describe Item do
  it "knows if its an 'Aged Brie'" do
    item = Item.new(name="Aged Brie", sell_in=2, quality=0)
    expect(item).to be_aged_brie
  end
end
