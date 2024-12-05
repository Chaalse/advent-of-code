import Utils (parseTuples, extractLists, normalizeString, areSameNumber)
import Data.List (sortBy, sort)

listDistance :: (Int, Int) -> Int
listDistance (x, y) = if x - y >= 0 then x - y else y - x

calculateScore :: [Int] -> Int -> Int
calculateScore (x:xs) y = y * length (filter (areSameNumber y) (x:xs))

firstPart :: [Int] -> [Int] -> IO()
firstPart list1 list2 = do 
    let ordered1 = sort list1
    let ordered2 = sort list2

    let totalDistance = sum $ map listDistance $ zip ordered1 ordered2

    print totalDistance

secondPart :: [Int] -> [Int] -> IO()
secondPart list1 list2 = do
    let score = sum $ map (calculateScore list2) list1

    print score

main :: IO ()
main = do
    content <- readFile "input1.txt"
    let normalizedContent = normalizeString content
    let tuples = parseTuples normalizedContent
    let (list1, list2) = extractLists tuples

    firstPart list1 list2

    secondPart list1 list2