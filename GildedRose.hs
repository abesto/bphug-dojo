{-# LANGUAGE NamedFieldPuns #-}

module GildedRose where

type Quality = Integer

data Item = Item { name :: String, sellIn :: Integer, quality :: Quality}

ageItem :: Item -> Item
ageItem =
    clampSellIn . clampQuality . decreaseSellIn . updateQuality

decreaseSellIn :: Item -> Item
decreaseSellIn item =
   item {
        sellIn = newSellIn item
   }   
   where
        newSellIn (Item{name="Sulfuras", sellIn}) = sellIn
        newSellIn item = pred $ sellIn item

updateQuality item =
    item {
         quality = newQuality item
         }
    where
        newQuality (Item{name="Sulfuras"}) = quality item
        newQuality (Item{name="AgedBrie", quality}) = min 50 (quality + 1)
        newQuality (Item{sellIn=0, quality}) = quality - 2
        newQuality (Item{quality}) = quality - 1

clampSellIn :: Item -> Item
clampSellIn item =
     item { sellIn = max 0 (sellIn item) }

clampQuality :: Item -> Item
clampQuality item =
    item { quality = max 0 (quality item) }
