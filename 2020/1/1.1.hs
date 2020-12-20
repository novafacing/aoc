import System.IO
import Data.List


twoSum :: (Num a, Eq a) => [a] -> a -> a
twoSum l1 num = head [x * y | x <- l1, y <- l1, x + y == num]

main = do
    contents <- fmap lines $ readFile "input"
    let report = (map read contents) :: [Int]
        match = twoSum report 2020
    print match
