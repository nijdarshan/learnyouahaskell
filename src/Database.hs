

{-# LANGUAGE OverloadedStrings #-}
module Database where

import Database.SQLite.Simple.FromRow
import Data.String

import Database.SQLite.Simple
import Types (MyData(..))
import Data.List (intercalate)
import System.Directory (getDirectoryContents)
import System.FilePath ((</>), takeExtension)
import Control.Monad (forM)

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


data FieldInfo = FieldInfo Int String String Int (Maybe String) Int deriving (Show)

instance FromRow FieldInfo where
  fromRow = FieldInfo <$> field <*> field <*> field <*> field <*> field <*> field

getTableNames :: Connection -> IO [(String, [FieldInfo])]
getTableNames conn = do
  tableNames <- query_ conn "SELECT name FROM sqlite_master WHERE type='table';" :: IO [Only String]
  forM tableNames $ \(Only name) -> do
    let queryStr = "PRAGMA table_info(" ++ name ++ ");"
    fields <- query_ conn (fromString queryStr) :: IO [FieldInfo]
    return (name, fields)

insertIntoTable :: Connection -> String -> [String] -> IO ()
insertIntoTable conn tableName dataRow = do
  let placeholders = intercalate ", " (replicate (length dataRow) "?")
  let query = "INSERT INTO " ++ tableName ++ " VALUES (" ++ placeholders ++ ")"
  execute conn (fromString query) dataRow