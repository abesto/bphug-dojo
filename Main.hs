import Test
import System.Exit


mainTests = []


main = handle $ runTests mainTests
       where handle result@(Fail msgs) = do
               print result
               exitFailure
             handle Pass = do
               print Pass
               exitSuccess
