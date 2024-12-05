module Utils where

import Data.Char (isSpace)
import Data.List (isPrefixOf, isSuffixOf)
import GHC.Num (abs)
import Data.Text (Text, unpack)


parseTuples :: String -> [(Int, Int)]
parseTuples input = map parseTuple (lines input)
  where
    parseTuple :: String -> (Int, Int)
    parseTuple s =
      let [first, second] = words s
      in (read first, read second)

extractLists :: [(Int, Int)] -> ([Int], [Int])
extractLists tuples = (map fst tuples, map snd tuples)

normalizeString :: String -> String
normalizeString input = removeEndingQuote $ removeLeadingQuote $ removeBackslashesBeforeNewlines input
  where
    removeLeadingQuote :: String -> String
    removeLeadingQuote s = if "\"" `isPrefixOf` s then tail s else s

    removeEndingQuote :: String -> String
    removeEndingQuote s = if "\"" `isSuffixOf` s then init s else s

    removeBackslashesBeforeNewlines :: String -> String
    removeBackslashesBeforeNewlines [] = []
    removeBackslashesBeforeNewlines ('\\':'n':xs) = '\n' : removeBackslashesBeforeNewlines xs
    removeBackslashesBeforeNewlines (x:xs) = x : removeBackslashesBeforeNewlines xs

areSameNumber :: Int -> Int -> Bool
areSameNumber a b = a == b

parseArrays :: [Text] -> [[Int]]
parseArrays = map parseArray
  where
    parseArray :: Text -> [Int]
    parseArray s = map read (words (unpack s))

removeItem :: Eq a => a -> [a] -> [a]
removeItem _ []                 = []
removeItem x (y:ys) | x == y    = ys
                    | otherwise = y : removeItem x ys