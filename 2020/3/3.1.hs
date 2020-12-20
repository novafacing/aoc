import System.IO
import Data.List

traverseForest :: [String] -> [Bool]
traverseForest forest = 
    let rowIndices = [0..(length forest) - 1]
        columnIndices = [x * 3 | x <- [0..]]
        trees = [forest !! fst p !! snd p | p <- zip rowIndices columnIndices]
    in [True| x <- trees, x == '#']

main = do
    -- Read the file and split it by lines into a list
    contents <- fmap lines $ readFile "input"

    let forest = (map cycle contents)
        traversal = traverseForest forest
    print $ length traversal
