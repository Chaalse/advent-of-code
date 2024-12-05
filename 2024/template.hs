import Utils (normalizeString)
import Data.Text (splitOn, pack)

firstPart :: IO()
firstPart = print "something"

secondPart :: IO()
secondPart = print "something"

main :: IO ()
main = do
    content <- readFile "input<day>.txt"
    let normalizedContent = normalizeString content
    let parsedContent = init $ splitOn (pack "\n") (pack normalizedContent)
    --This is a placeholder to have an IO op.
    print normalizedContent
