import Data.Char (isSpace)
import Utils (removeItem)

parseArrays :: String -> [[Int]]
parseArrays input = map parseArray (lines input)
  where
    parseArray :: String -> [Int]
    parseArray s =
      let [first, second] = words s
      in [read first, read second]

extractLists :: [(Int, Int)] -> ([Int], [Int])
extractLists tuples = (map fst tuples, map snd tuples)

main :: IO ()
main = do
  
  
  print (removeItem 2 [1, 2, 7, 8, 9])
  --let (list1, list2) = extractLists tuples