import System.Environment (getArgs)
import Database.SQLite.Simple (open, close, Only, query_)
import Database 
import Fetch 
import Parse 
import Types (MyData)
import Control.Monad (when)
import System.IO (hFlush, stdout)
import Data.List.Split (splitOn)

import qualified Data.Text as T

import System.Environment (getArgs)

main = do
  args <- getArgs
  case args of
    ["db", "init", dbName] -> do
      conn <- open dbName
      close conn
    ["db", "create", dbName, tableName, fieldDetailsStr] -> do
      let fieldDetails = map (\str -> let [name, type'] = words str in (name, type')) $ splitOn "," fieldDetailsStr
      conn <- open dbName
      createTable conn tableName fieldDetails
      close conn
    ["db", "fetch", dbName] -> do
      chapters <- fetchAndParse
      conn <- open dbName
      --mapM_ (insertData conn . MyData (chapterName chapter) (length (lessons chapter))) chapters
      close conn
    ["db", "showtables", dbName] -> do
      conn <- open dbName
      tables <- getTableNames conn
      mapM_ print tables
      close conn
    -- ["db", "show", dbName, tableName] -> do
    --   conn <- open dbName
    --   myData <- getAllData conn
    --   close conn
    --   mapM_ print myData
    -- ["db", "insert", dbName, tableName, fieldValuesStr] -> do
    --   let fieldValues = map (\str -> let [name, value] = words str in (name, value)) $ splitOn "," fieldValuesStr
    --   conn <- open dbName
    --   insertData conn tableName fieldValues
    --   close conn
    -- ["db", "delete", dbName, tableName, fieldName, fieldValue] -> do
    --   conn <- open dbName
    --   deleteData conn tableName fieldName fieldValue
    --   close conn
    -- ["db", "update", dbName, tableName, fieldName, fieldValue, updateFieldName, updateFieldValue] -> do
    --   conn <- open dbName
    --   updateData conn tableName fieldName fieldValue updateFieldName updateFieldValue
    --   close conn
    -- ["db", "drop", dbName, tableName] -> do
    --   conn <- open dbName
    --   dropTable conn tableName
    --   close conn
    -- ["db", "dropall", dbName] -> do
    --   conn <- open dbName
    --   dropAllTables conn
    --   close conn
    -- ["db", "dropall", dbName, "confirm"] -> do
    --   conn <- open dbName
    --   dropAllTables conn
    --   close conn
    -- ["db", "dropall", dbName, "confirm", "really"] -> do
    --   conn <- open dbName
    --   dropAllTables conn
    --   close conn
    -- ["db", "dropall", dbName, "confirm", "really", "yes"] -> do
    --   conn <- open dbName
    --   dropAllTables conn
    --   close conn
    -- ["db", "dropall", dbName, "confirm", "really", "yes", "i", "am", "sure"] -> do
    --   conn <- open dbName
    --   dropAllTables conn
    --   close conn
    -- ["db", "dropall", dbName, "confirm", "really", "yes", "i", "am", "sure", "do", "it"] -> do
    --   conn <- open dbName
    --   dropAllTables conn
    --   close conn
    -- ["db", "dropall", dbName, "confirm", "really", "yes"]
    _ -> putStrLn "Invalid command"
    ["insert"] -> do
      conn <- open "mydata.db"
      dataText <- fetchData
      let dataString = T.unpack dataText
      let myData = parseData dataString
      mapM_ (insertData conn) myData
      close conn
    ["show"] -> do
      conn <- open "mydata.db"
      tables <- getTableNames conn
      mapM_ print tables
      close conn
    ["displayFetched"] -> displayFetchedData
    ["displayParsed"] -> do
      dataText <- fetchData
      let dataString = T.unpack dataText
      displayParsedData dataString
    ["fetchAndParse"] -> fetchAndParse >>= mapM_ print
    ["displayParsedHTML"] -> do
      dataText <- fetchData
      let dataString = T.unpack dataText
      displayParsedHTML dataString
    ["fetch"] -> do
      conn <- open "mydata.db"
      myData <- getAllData conn
      close conn
      generateJson myData
    _ -> putStrLn $ unlines
      [ ""
      , "Available commands are:"
      , ""
      , "db"
      , "insert"
      , "show"
      , "displayFetched"
      , "displayParsed"
      , "fetchAndParse"
      , "displayParsedHTML"
      , "fetch"
      ]