import Data.Text (splitOn, pack, unpack)
import Utils (removeItem)

---- FIRST PART ----
isSafeDelta :: Int -> Int -> Bool
isSafeDelta a b = abs (a - b ) <= 3 && abs (a - b) > 0

isSafeOrder :: (Int, Int) -> (Int, Int) -> Bool
isSafeOrder (a, b) (x, y) = (a > b && x > y) || (a < b && x < y)

isSafe :: Int -> Int -> (Int, Int) -> Bool
isSafe x y (a, b) = isSafeDelta x y && isSafeOrder (a, b) (x, y)

checkReportsSafety :: [Int] -> Int
checkReportsSafety input = checkReportSafety True input
    where
        checkReportSafety :: Bool -> [Int] -> Int
        checkReportSafety False _ = 0
        checkReportSafety True [x, y] = if isSafe x y (head input, last input) then 1 else 0
        checkReportSafety True (x:xs) = checkReportSafety (isSafe x (head xs) (head input, last input)) xs 


firstPart :: [[Int]] -> IO()
firstPart arrays = do
    let reportsChecking = sum $ map checkReportsSafety arrays

    print reportsChecking

---- SECOND PART ----
checkReportsWithDampener :: Bool -> [Int] -> Int
checkReportsWithDampener _ input = checkWithDampener True (0, 0) input
    where
    checkWithDampener :: Bool -> (Int, Int) -> [Int] -> Int    
    checkWithDampener False (x, y) _
        | checkReportsSafety (removeItem x input) == 1 = 1
        | checkReportsSafety (removeItem y input) == 1 = 1
        | otherwise = 0
    checkWithDampener True _ [x, y] = 1
    checkWithDampener True _ (x:xs) = checkWithDampener (isSafe x (head xs) (head input, last input)) (x, head xs) xs

secondPart :: [[Int]] -> IO()
secondPart arrays = do
    let dampenedReports = sum $ map (checkReportsWithDampener True) arrays

    print dampenedReports

main :: IO ()
main = do
    content <- readFile "input2.txt"
    let normalizedContent = normalizeString content
    let parsedContent = init $ splitOn (pack "\n") (pack normalizedContent)
    let arrays = parseArrays parsedContent
    
    firstPart arrays
    secondPart arrays