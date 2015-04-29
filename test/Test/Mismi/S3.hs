{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Test.Mismi.S3 (
    Token
  , LocalPath (..)
  , testBucket
  , withToken
  ) where

import           Control.Monad.IO.Class (liftIO)
import           Control.Monad.Catch (bracket_)

import qualified Data.List as L
import           Data.Text as T
import           Data.UUID as U
import           Data.UUID.V4 as U

import           System.Posix.Env
import           System.FilePath hiding ((</>))

import           Mismi.S3.Control
import           Mismi.S3.Commands
import           Mismi.S3.Data

import           Orphanarium.Corpus

import           Test.Mismi
import           Test.Mismi.Arbitrary ()

data Token =
  Token {
      unToken :: Text
    } deriving (Eq, Show)

instance Arbitrary Token where
  arbitrary = do
    n <- T.pack . show <$> (choose (0, 10000) :: Gen Int)
    c <- elements cooking
    m <- elements muppets
    pure . Token . T.intercalate "." $ [c, m, n]

data LocalPath =
  LocalPath {
      localPath :: FilePath
    } deriving (Eq, Show)

instance Arbitrary LocalPath where
  arbitrary = do
    x <- elements weather
    xs <- listOf $ elements simpsons
    pure . LocalPath $ L.intercalate "/" (T.unpack <$> x : xs)

testBucket :: IO Bucket
testBucket =
  Bucket . T.pack . fromMaybe "ambiata-dev-view" <$> getEnv "AWS_TEST_BUCKET"

withToken :: Token -> (Address -> S3Action a) -> S3Action a
withToken t f = do
  b <- liftIO testBucket
  u <- liftIO $ T.pack . U.toString <$> U.nextRandom
  let a = Address b (Key . T.intercalate "/" $ ["mismi", u, unToken t])
  bracket_ (pure ()) (listRecursively a >>= mapM_ delete >> delete a) (f a)