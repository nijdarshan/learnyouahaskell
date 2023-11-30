{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}

module Types where

import GHC.Generics
import Data.Aeson
import Data.Map (Map)

type URL = String

data MyData = MyData
  { field1 :: String
  , field2 :: Int
  -- Add more fields as needed
  } deriving (Show, Eq, Generic, ToJSON)

data Lesson = Lesson
  { lessonName :: String
  , url :: URL
  } deriving (Show, Eq)

type Lessons = Map Int Lesson

data Chapter = Chapter
  { chapterName :: String
  , lessons :: Lessons
  } deriving (Show, Eq)

type Chapters = Map Int Chapter

type Course = Map String Chapters

