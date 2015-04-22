{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Mismi.Test.S3 (
    Token
  , KeyTmp (..)
  , LocalPath (..)
  , testBucket
  , withTmpKey
  , withToken
  , (<//>)
  ) where

import           Control.Monad.IO.Class (liftIO)
import           Control.Monad.Catch (bracket_)

import qualified Data.List as L
import           Data.Text as T
import           Data.UUID as U
import           Data.UUID.V4 as U

import           System.Posix.Env
import           System.FilePath hiding ((</>))

import           Mismi.Arbitrary ()
import           Mismi.S3.Control
import           Mismi.S3.Commands
import           Mismi.S3.Data
import           Mismi.Test

import           Orphanarium.Corpus

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

data KeyTmp = KeyTmp {
    tmpPath :: Key
  , tmpBody :: Text
  } deriving (Eq, Show)


-- Ensure everything is under our own key space for debugging
instance Arbitrary KeyTmp where
  arbitrary = KeyTmp  <$> arbitrary <*> arbitrary

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

(<//>) :: KeyTmp -> Key -> KeyTmp
(<//>) (KeyTmp k1 b) k2 = KeyTmp (k1 </> k2) b

withToken :: Token -> (Address -> S3Action a) -> S3Action a
withToken t f = do
  b <- liftIO testBucket
  u <- liftIO $ T.pack . U.toString <$> U.nextRandom
  let a = Address b (Key . T.intercalate "/" $ [u, unToken t])
  bracket_ (pure ()) (listRecursively a >>= mapM_ delete >> delete a) (f a)

withTmpKey :: Address -> KeyTmp -> S3Action ()
withTmpKey prefix (KeyTmp k body') =
  write Fail (withKey (</> k) prefix) body'
