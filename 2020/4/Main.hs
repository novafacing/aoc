import System.IO
import Data.List as L
import Data.Map as M
import Data.Maybe
import Data.List.Split

createRecord :: String -> M.Map String String
createRecord ln = 
    let parts = words ln -- [String]
        sparts = L.map (span (/=':')) parts
        record = M.fromList sparts
    in record

checkRecord :: M.Map String String -> Bool
checkRecord record = 
    let requirements = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
        passCount = catMaybes $ L.map (flip M.lookup $ record) requirements
    in length passCount == length requirements

main = do
    -- Read the file and split it by lines into a list
    contents <- fmap (splitOn "\n\n") $ readFile "input"
    let rawRecords = L.filter (/="") contents
        records = L.map createRecord rawRecords
        results = L.map checkRecord records
    print $ length $ L.filter (== True) results
