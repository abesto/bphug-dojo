module GildedRoseTest where

import GildedRose
import Test

allTests :: Item -> [Test]
allTests i = let i2 = ageItem i in
    [ Test (quality i2 == quality i - 1) "quality decrease"
    --, Test (sellIn i2 == sellIn i - 1) "sellIn decrease"
    ]

testInventory :: [Item]
testInventory = [Item {sellIn=1, quality=1}
                ,Item {sellIn=0, quality=42}
                ]


tests :: [Test]
tests = concatMap allTests testInventory