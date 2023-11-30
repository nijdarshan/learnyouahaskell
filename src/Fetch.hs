{-# LANGUAGE OverloadedStrings #-}

module Fetch where

import Network.HTTP.Conduit (simpleHttp)
import qualified Data.Text as T
import qualified Data.Text.Encoding as E
import qualified Data.ByteString.Lazy as BL
import qualified Data.Text.IO as TIO
import Types (Chapter)
import Parse (parseHTML, parseData, generateJson, displayParsedData, displayParsedHTML, parseChapter, parseLesson, parseLessons)

fetchData :: IO T.Text
fetchData = do
  res <- simpleHttp "http://learnyouahaskell.com/chapters"
  return $ E.decodeUtf8 $ BL.toStrict res

displayFetchedData :: IO ()
displayFetchedData = fetchData >>= TIO.putStrLn

fetchAndParse :: IO [Chapter]
fetchAndParse = do
  dataText <- fetchData
  let dataString = T.unpack dataText
  return $ parseHTML dataString