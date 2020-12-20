import System.IO
import Data.List


threeSum :: (Num a, Eq a) => [a] -> a -> a
threeSum l1 num = head [x * y  * z | x <- l1, y <- l1, z <- l1, x + y + z == num]

main = do
    contents <- fmap lines $ readFile "input"
    let report = (map read contents) :: [Int]
        match = threeSum report 2020
    print match
