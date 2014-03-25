module GildedRose where

type Quality = Integer

data Item = Item { name :: String, sellIn :: Integer, quality :: Quality}

ageItem :: Item -> Item
ageItem (Item name oldSellin oldQuality) =
    Item { name = name 
         , sellIn = oldSellin - 1
         , quality = oldQuality - (if oldSellin == 0 then 2 else 1)
         }
