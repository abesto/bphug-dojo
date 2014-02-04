import Test
import System.Exit

import GildedRoseTest


mainTests = tests

main = handle $ runTests mainTests
       where handle result@(Fail msgs) = do
               print result
               exitFailure
             handle Pass = do
               print Pass
               exitSuccess
