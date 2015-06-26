{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Test.Mismi.Arbitrary where

import           Network.AWS.Types

import           Test.QuickCheck
import           Test.QuickCheck.Instances ()

import           Data.Text
import           Data.Text.Encoding

import           P



instance Arbitrary Region where
  -- Shorter list than possible, aws doesn't support all potential Regions.
  arbitrary = elements [Ireland, Tokyo, Singapore, Sydney, NorthCalifornia, Oregon]

instance Arbitrary AccessKey where
  arbitrary = AccessKey <$> (encodeUtf8 <$> arbitrary)

instance Arbitrary SecretKey where
  arbitrary = SecretKey <$> (encodeUtf8 <$> arbitrary)

instance Arbitrary SecurityToken where
  arbitrary = SecurityToken <$> (encodeUtf8 <$> arbitrary)
