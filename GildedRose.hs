module GildedRose where

type Quality = Integer

data Item = Item { sellIn :: Integer, quality :: Quality}

ageItem :: Item -> Item
ageItem (Item oldSellin oldQuality) =
    Item { sellIn = oldSellin - 1
         , quality = oldQuality - (if oldSellin == 0 then 2 else 1)
         }
