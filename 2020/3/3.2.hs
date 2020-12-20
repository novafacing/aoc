import System.IO
import Data.List

traverseForest :: [String] -> (Int, Int) -> [Bool]
traverseForest forest slope = 
    let rowIndices = [x | x <- [0..(length forest) - 1], x `mod` (snd slope) == 0]
        columnIndices = [x * (fst slope) | x <- [0..]]
        trees = [forest !! fst p !! snd p | p <- zip rowIndices columnIndices]
    in [True| x <- trees, x == '#']

main = do
    -- Read the file and split it by lines into a list
    contents <- fmap lines $ readFile "input"

    let forest = (map cycle contents)
        slopes = [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)]
        forestTraverse = traverseForest forest
        traversal = map forestTraverse slopes
        treeCounts = map length traversal
    print $ foldl (*) 1 treeCounts
