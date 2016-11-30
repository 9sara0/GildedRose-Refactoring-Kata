class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if !item.aged_brie? and !item.backstage_passes?
        if item.quality > 0
          if !item.sulfuras?
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.backstage_passes?
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if !item.sulfuras?
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if !item.aged_brie?
          if !item.backstage_passes?
            if item.quality > 0
              if !item.sulfuras?
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def aged_brie?
    @name == "Aged Brie"
  end

  def backstage_passes?
    @name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def sulfuras?
    @name == "Sulfuras, Hand of Ragnaros"
  end

  def special?
    aged_brie? || backstage_passes? || sulfuras?
  end

end
