import System.IO
import Data.List

uncurry4 :: (a -> b -> c -> d -> e) -> ((a, b, c, d) -> e)
-- Make a func that takes 4 args take a 4-tuple
uncurry4 f ~(a, b, c, d) = f a b c d

between :: Int -> Int -> Int -> Bool
-- check if x <= y <= z
between x y z = y <= z && y >= x

checkPassword :: Int -> Int -> Char -> String -> Bool
-- Password is valid if it has between min and max occurrences of required char
checkPassword mn mx req pass = between mn (length [x | x <- pass, x == req]) mx

decomposeRecord :: String -> (Int, Int, Char, String)
decomposeRecord record = 
    let splitRecord = words record
        -- take until we hit '-'
        mn = read $ takeWhile (/='-') (splitRecord !! 0)
        -- take after we hit '-' and slice off the head
        mx = read $ tail $ dropWhile (/='-') (splitRecord !! 0)
        -- always one char
        req = (splitRecord !! 1) !! 0
        -- last string
        pass = (splitRecord !! 2)
    in (mn, mx, req, pass)

main = do
    -- Read the file and split it by lines into a list
    contents <- fmap lines $ readFile "input"
    -- Split each line into a record with min, max, required
    -- character, and the pasword itself
    let report = map decomposeRecord contents
        -- check each password
        rptcount = map (uncurry4 checkPassword) report
    -- Dump out the status of each password
    putStr $ unlines $ map show (zip report rptcount)
    -- And the final answer
    print $ length [x | x <- rptcount, not x]
