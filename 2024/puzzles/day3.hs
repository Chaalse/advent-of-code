import Utils (normalizeString)
import Data.Text (splitOn, pack)

firstPart :: IO()
firstPart = print "something"

secondPart :: IO()
secondPart = print "something"

main :: IO ()
main = do
    content <- readFile "inputs/mini-input3.txt"
    let normalizedContent = normalizeString content
    let parsedContent = init $ splitOn (pack "\n") (pack normalizedContent)

    print normalizedContent
    --firstPart
    --secondPart
