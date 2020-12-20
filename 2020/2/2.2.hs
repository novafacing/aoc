import System.IO
import Data.List

uncurry4 :: (a -> b -> c -> d -> e) -> ((a, b, c, d) -> e)
uncurry4 f ~(a, b, c, d) = f a b c d

-- XOR (redundant, I'm just having fun)
(^^^) :: Bool -> Bool -> Bool
a ^^^ b = a /= b

checkPassword :: Int -> Int -> Char -> String -> Bool
-- This time we just want to check the two indices
checkPassword mn mx req pass = (pass !! (mn - 1) == req) ^^^ (pass !! (mx - 1) == req)

decomposeRecord :: String -> (Int, Int, Char, String)
decomposeRecord record = 
    let splitRecord = words record
        mn = read $ takeWhile (/='-') (splitRecord !! 0)
        mx = read $ tail $ dropWhile (/='-') (splitRecord !! 0)
        req = (splitRecord !! 1) !! 0
        pass = (splitRecord !! 2)
    in (mn, mx, req, pass)

main = do
    contents <- fmap lines $ readFile "input"
    let report = map decomposeRecord contents
        rptcount = map (uncurry4 checkPassword) report
    putStr $ unlines $ map show (zip report rptcount)
    print $ length [x | x <- rptcount, x]
