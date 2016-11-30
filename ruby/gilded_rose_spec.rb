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

  describe "#backstage_passes?" do
    it "knows if its a 'Backstage passes'" do
      item = Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)
      expect(item).to be_backstage_passes
    end

    it "knows if its not a 'Backstage passes'" do
      item = Item.new(name="Dexterity Vest", sell_in=2, quality=1)
      expect(item).not_to be_backstage_passes
    end
  end

  describe "#sulfuras?" do
    it "knows if its a 'Sulfuras'" do
      item = Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=15, quality=20)
      expect(item).to be_sulfuras
    end

    it "knows if its not a 'Sulfuras'" do
      item = Item.new(name="Dexterity Vest", sell_in=2, quality=1)
      expect(item).not_to be_sulfuras
    end
  end

  describe "#special?" do
    it "knows if its a 'Special Item': 'Aged Brie', 'Backstage passes' or 'Sulfuras'" do
      item = Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=15, quality=20)
      expect(item).to be_special
    end

    it "knows if its not a 'Special'" do
      item = Item.new(name="Dexterity Vest", sell_in=2, quality=1)
      expect(item).not_to be_special
    end
  end

  describe "#has_min_quality?" do
    it "knows if has MIN_QUALITY" do
      item = Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=15, quality=Item::MIN_QUALITY)
      expect(item).to have_min_quality
    end

    it "knows if its quality is above MIN_QUALITY" do
      item = Item.new(name="Dexterity Vest", sell_in=2, quality=(Item::MIN_QUALITY + 1))
      expect(item).not_to have_min_quality
    end
  end
end
