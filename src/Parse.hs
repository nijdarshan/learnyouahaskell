module Parse (parseHTML, parseData, generateJson, displayParsedData, displayParsedHTML, parseChapter, parseLesson, parseLessons) where
import Types (Chapter(..), Lessons, Lesson(..), MyData(..))
import Text.HTML.TagSoup (Tag, partitions, (~==), parseTags, innerText, (~/=), fromAttrib)
import qualified Data.Map as Map
import Data.Aeson (encode)
import qualified Data.ByteString.Lazy as B

-- Define your parsing function here
parseData :: String -> [MyData]
parseData str = map parseLine (lines str)
  where
    parseLine line = MyData {
        field1 = line,
        field2 = length line
    }

-- Function to generate JSON representation
generateJson :: [MyData] -> IO ()
generateJson myData = B.writeFile "data.json" (encode myData)

displayParsedData :: String -> IO ()
displayParsedData = mapM_ print . parseData

displayParsedHTML :: String -> IO ()
displayParsedHTML = mapM_ print . parseHTML

parseHTML :: String -> [Chapter]
parseHTML html = map parseChapter $ partitions (~== "<li>") $ parseTags html

parseChapter :: [Tag String] -> Chapter
parseChapter tags = Chapter
  { chapterName = innerText $ takeWhile (~/= "</a>") tags
  , lessons = parseLessons $ dropWhile (~/= "<ul>") tags
  }

parseLessons :: [Tag String] -> Lessons
parseLessons tags = Map.fromList $ zip [1..] $ map parseLesson $ partitions (~== "<li>") tags

parseLesson :: [Tag String] -> Lesson
parseLesson tags = Lesson
  { lessonName = innerText $ takeWhile (~/= "</a>") tags
  , url = fromAttrib "href" $ head $ filter (~== "<a>") tags
  }