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
  describe "#aged_brie?" do
    it "knows if its an 'Aged Brie'" do
      item = Item.new(name="Aged Brie", sell_in=2, quality=0)
      expect(item).to be_aged_brie
    end

    it "knows if it is not an 'Aged Brie'" do
      item = Item.new(name="Dexterity Vest", sell_in=2, quality=1)
      expect(item).not_to be_aged_brie
    end
  end

  it "knows if its a 'Backstage passes'" do
    item = Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)
    expect(item).to be_backstage_passes
  end
end
