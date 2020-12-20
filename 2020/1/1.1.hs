import System.IO
import Data.List


-- Constrain TYPE a to be in Num and Eq
-- We take a list of type a and an instance of type a and return an instance of type a
twoSum :: (Num a, Eq a) => [a] -> a -> a
-- return the product of two numbers from l1 whose sum is num
twoSum l1 num = head [x * y | x <- l1, y <- l1, x + y == num]

main = do
    -- Read the file and split it by lines into a list
    contents <- fmap lines $ readFile "input"
    -- Map "read" to the list (note we specify it must be [Int] type
    let report = (map read contents) :: [Int]
        -- Use previous var as args to twoSum function
        match = twoSum report 2020
    -- Display it!
    print match
