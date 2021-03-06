module GildedRoseTest where

import GildedRose
import Test

testQualityOf :: Item -> Quality
testQualityOf = quality . ageItem

testSellInOf :: Item -> Integer
testSellInOf = sellIn . ageItem

-- Base case
standardItem = Item "testItem" 5 5
qualityDecreasesByOne = Test (testQualityOf standardItem == 4) "An item that needs to be sold in 2 days, needs to be sold in 1 day tomorrow"
sellInDecreasesByOne = Test (testSellInOf standardItem == 4) "An item with quality 2 will have quality 1 tomorrow"

sellInReachedItem = Item "testItem" 0 5
sellInReachedSellInRemainsZero = Test (testSellInOf sellInReachedItem == 0) "The sellIn value cannot go below 0"

-- Step 1 "Once the sellIn date has passed, Quality degrades twice as fast"
sellInReachedQualityDegradesFaster = Test (testQualityOf sellInReachedItem == 3) "The quality of an item whose sellIn date has already passed degrades twice as fast"

-- Step 2 "The Quality of an item is never negative"
fullyDegradedItem = Item "testItem" 2 0
fullyDegraded = Test (testQualityOf fullyDegradedItem == 0) "The quality of an item does not go below 0"

almostDegradedAndReachedSellInItem = Item "testItem" 0 1
almostDegradedAndReachedSellIn = Test (testQualityOf almostDegradedAndReachedSellInItem == 0) "An almost degraded item that already needed to be sold does not go to negative quality"

-- Step 3 "'Aged Brie' actually increases in Quality the older it gets"
agedBrie = Item "AgedBrie" 3 3
agedBrieQualityIncreases = Test (testQualityOf agedBrie == 4) "The quality of AgedBrie increases"

agedBrieReachedSellIn = Item "AgedBrie" 0 3
agedBrieReachedSellInQualityIncreases = Test (testQualityOf agedBrieReachedSellIn == 4) "The quality of AgedBrie increases even if it has reached its sellIn date"

-- Step 4 "The Quality of an item is never more than 50"
veryAgedBrie = Item "AgedBrie" 1 50
veryAgedBrieDoesNotIncreaseQuality = Test (testQualityOf veryAgedBrie == 50) "The quality of AgedBrie does not exceed 50"

-- Step 5 "'Sulfuras', being a legendary item, never has to be sold or decreases in Quality"
sulfuras = Item "Sulfuras" 1 1
sulfurasDontExpire = Test (testSellInOf sulfuras == 1) "Sulfuras do not expire"
sulfurasDontDegrade = Test (testQualityOf sulfuras == 1) "Sulfuras do not degrade"

-- Step 6 "'Backstage passes', like aged brie, increases in Quality as it’s SellIn value approaches;
--        "Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert"
backStagePass = Item "Backstage passes" 15 1
backStagePass10Days = Item "Backstage passes" 10 1
backStagePass5Days = Item "Backstage passes" 5 1
backStagePassAfterConcert = Item "Backstage passes" 1 5

backStagePassLongBefore = Test (testQualityOf backStagePass == 1) "Backstage passes slowly increase in quality long before the concert"
backStagePass10DaysBefore = Test (testQualityOf backStagePass10Days == 3) "Backstage passes increase in quality quickly 10 days before the concert"
backStagePass5DaysBefore = Test (testQualityOf backStagePass5Days == 4) "Backstage passes increase in quality rapidly 5 days before the concert"
backStagePassDegradesAfterConcert = Test (testQualityOf backStagePassAfterConcert == 0) "Backstage passes lose quality immediately after the concert"


gildedRoseTests = [qualityDecreasesByOne,
                  sellInDecreasesByOne,
                  sellInReachedSellInRemainsZero,
                  sellInReachedQualityDegradesFaster,
                  fullyDegraded,
                  almostDegradedAndReachedSellIn,
                  agedBrieQualityIncreases,
                  agedBrieReachedSellInQualityIncreases,
                  veryAgedBrieDoesNotIncreaseQuality,
                  sulfurasDontExpire,
                  sulfurasDontDegrade
                  --backStagePassLongBefore,
                  --backStagePass10DaysBefore,
                  --backStagePass5DaysBefore,
                  --backStagePassDegradesAfterConcert
                  ]
