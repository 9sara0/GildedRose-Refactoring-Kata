class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if !item.special?
        item.quality -=1 if !item.has_min_quality?
      else
        if !item.has_max_quality?
          item.quality += 1
          if item.backstage_passes?
            if item.sell_in < 11
              item.quality += 1 if !item.has_max_quality?
            end
            if item.sell_in < 6
              if !item.has_max_quality?
                item.quality += 1
              end
            end
          end
        end
      end

      item.sell_in -= 1 if !item.sulfuras?

      if item.sell_in < 0
        if !item.special?
          item.quality -= 1 if !item.has_min_quality?
        end

        item.quality -= item.quality if item.backstage_passes?

        if item.aged_brie?
          item.quality += 1 if !item.has_max_quality?
        end


      end
    end
  end
end

class Item
  MIN_QUALITY = 0
  MAX_QUALITY = 50

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

  def has_min_quality?
    @quality <= MIN_QUALITY
  end

  def has_max_quality?
    @quality >= MAX_QUALITY
  end
end
