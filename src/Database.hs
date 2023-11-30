module Database where

import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow
import Types (MyData(..))
import Data.String (fromString)
import Data.List (intercalate)

import System.Directory (getDirectoryContents)
import System.FilePath ((</>), takeExtension)

listDatabases :: IO [FilePath]
listDatabases = do
  files <- getDirectoryContents "."
  return $ filter (\file -> takeExtension file == ".db") files

instance FromRow MyData where
  fromRow = MyData <$> field <*> field

-- createTable :: Connection -> IO ()
-- createTable conn = execute_ conn 
--   (fromString "CREATE TABLE IF NOT EXISTS mydata (field1 TEXT, field2 INTEGER)")

createTable :: Connection -> String -> [(String, String)] -> IO ()
createTable conn tableName fields = execute_ conn 
  (fromString $ "CREATE TABLE IF NOT EXISTS " ++ tableName ++ " " ++ fieldsStr)
  where
    fieldsStr = "(" ++ (intercalate ", " $ map (\(name, type') -> name ++ " " ++ type') fields) ++ ")"

insertData :: Connection -> MyData -> IO ()
insertData conn (MyData field1 field2) = execute conn 
  (fromString "INSERT INTO mydata (field1, field2) VALUES (?, ?)") (field1, field2)

getAllData :: Connection -> IO [MyData]
getAllData conn = query_ conn 
  (fromString "SELECT field1, field2 FROM mydata")

getTableNames :: Connection -> IO [Only String]
getTableNames conn = query_ conn 
  (fromString "SELECT name FROM sqlite_master WHERE type='table';")