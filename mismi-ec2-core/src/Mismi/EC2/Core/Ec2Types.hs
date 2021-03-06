{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Mismi.EC2.Core.Ec2Types (
    MismiInstanceType(..)
  , virtualizationFor
  , renderMismiInstanceType
  , parseMismiInstanceType
  ) where

import           Mismi.EC2.Core.MismiTypes

import           P

-- | Mismi's view of available EC2 instance types.
data MismiInstanceType =
    C1_Medium
  | C1_XLarge
  | C3_2XLarge
  | C3_4XLarge
  | C3_8XLarge
  | C3_Large
  | C3_XLarge
  | C4_2XLarge
  | C4_4XLarge
  | C4_8XLarge
  | C4_Large
  | C4_XLarge
  | C5_18XLarge
  | C5_2XLarge
  | C5_4XLarge
  | C5_9XLarge
  | C5_Large
  | C5_XLarge
  | C5d_18XLarge
  | C5d_2XLarge
  | C5d_4XLarge
  | C5d_9XLarge
  | C5d_Large
  | C5d_XLarge
  | CC1_4XLarge
  | CC2_8XLarge
  | CG1_4XLarge
  | CR1_8XLarge
  | D2_2XLarge
  | D2_4XLarge
  | D2_8XLarge
  | D2_XLarge
  | F1_16XLarge
  | F1_2XLarge
  | G2_2XLarge
  | G2_8XLarge
  | G3_16XLarge
  | G3_4XLarge
  | G3_8XLarge
  | H1_16XLarge
  | H1_2XLarge
  | H1_4XLarge
  | H1_8XLarge
  | HI1_4XLarge
  | HS1_8XLarge
  | I2_2XLarge
  | I2_4XLarge
  | I2_8XLarge
  | I2_XLarge
  | I3_16XLarge
  | I3_2XLarge
  | I3_4XLarge
  | I3_8XLarge
  | I3_Large
  | I3_Metal
  | I3_XLarge
  | M1_Large
  | M1_Medium
  | M1_Small
  | M1_XLarge
  | M2_2XLarge
  | M2_4XLarge
  | M2_XLarge
  | M3_2XLarge
  | M3_Large
  | M3_Medium
  | M3_XLarge
  | M4_10XLarge
  | M4_16XLarge
  | M4_2XLarge
  | M4_4XLarge
  | M4_Large
  | M4_XLarge
  | M5_12XLarge
  | M5_24XLarge
  | M5_2XLarge
  | M5_4XLarge
  | M5_Large
  | M5_XLarge
  | M5d_12XLarge
  | M5d_24XLarge
  | M5d_2XLarge
  | M5d_4XLarge
  | M5d_Large
  | M5d_XLarge
  | P2_16XLarge
  | P2_8XLarge
  | P2_XLarge
  | P3_16XLarge
  | P3_2XLarge
  | P3_8XLarge
  | R3_2XLarge
  | R3_4XLarge
  | R3_8XLarge
  | R3_Large
  | R3_XLarge
  | R4_16XLarge
  | R4_2XLarge
  | R4_4XLarge
  | R4_8XLarge
  | R4_Large
  | R4_XLarge
  | R5_12XLarge
  | R5_16XLarge
  | R5_24XLarge
  | R5_2XLarge
  | R5_4XLarge
  | R5_8XLarge
  | R5_Large
  | R5_Metal
  | R5_XLarge
  | R5d_12XLarge
  | R5d_16XLarge
  | R5d_24XLarge
  | R5d_2XLarge
  | R5d_4XLarge
  | R5d_8XLarge
  | R5d_Large
  | R5d_Metal
  | R5d_XLarge
  | T1_Micro
  | T2_2XLarge
  | T2_Large
  | T2_Medium
  | T2_Micro
  | T2_Nano
  | T2_Small
  | T2_XLarge
  | X1_16XLarge
  | X1_32XLarge
  | X1e_16XLarge
  | X1e_2XLarge
  | X1e_32XLarge
  | X1e_4XLarge
  | X1e_8XLarge
  | X1e_XLarge
  | Z1d_12XLarge
  | Z1d_2XLarge
  | Z1d_3XLarge
  | Z1d_6XLarge
  | Z1d_Large
  | Z1d_XLarge
    deriving (Eq, Show, Ord, Enum, Bounded)


virtualizationFor :: MismiInstanceType -> MismiVirtualizationType
virtualizationFor itype =
  case itype of
     C1_Medium ->
      Paravirtual
     C1_XLarge ->
      Paravirtual
     C3_2XLarge ->
      HVM
     C3_4XLarge ->
      HVM
     C3_8XLarge ->
      HVM
     C3_Large ->
      HVM
     C3_XLarge ->
      HVM
     C4_2XLarge ->
      HVM
     C4_4XLarge ->
      HVM
     C4_8XLarge ->
      HVM
     C4_Large ->
      HVM
     C4_XLarge ->
      HVM
     C5_18XLarge ->
      HVM
     C5_2XLarge ->
      HVM
     C5_4XLarge ->
      HVM
     C5_9XLarge ->
      HVM
     C5_Large ->
      HVM
     C5_XLarge ->
      HVM
     C5d_18XLarge ->
      HVM
     C5d_2XLarge ->
      HVM
     C5d_4XLarge ->
      HVM
     C5d_9XLarge ->
      HVM
     C5d_Large ->
      HVM
     C5d_XLarge ->
      HVM
     CC1_4XLarge ->
      Paravirtual
     CC2_8XLarge ->
      Paravirtual
     CG1_4XLarge ->
      Paravirtual
     CR1_8XLarge ->
      Paravirtual
     D2_2XLarge ->
      HVM
     D2_4XLarge ->
      HVM
     D2_8XLarge ->
      HVM
     D2_XLarge ->
      HVM
     F1_16XLarge ->
      HVM
     F1_2XLarge ->
      HVM
     G2_2XLarge ->
      HVM
     G2_8XLarge ->
      HVM
     G3_16XLarge ->
      HVM
     G3_4XLarge ->
      HVM
     G3_8XLarge ->
      HVM
     H1_16XLarge ->
      HVM
     H1_2XLarge ->
      HVM
     H1_4XLarge ->
      HVM
     H1_8XLarge ->
      HVM
     HI1_4XLarge ->
      Paravirtual
     HS1_8XLarge ->
      Paravirtual
     I2_2XLarge ->
      HVM
     I2_4XLarge ->
      HVM
     I2_8XLarge ->
      HVM
     I2_XLarge ->
      HVM
     I3_16XLarge ->
      HVM
     I3_2XLarge ->
      HVM
     I3_4XLarge ->
      HVM
     I3_8XLarge ->
      HVM
     I3_Large ->
      HVM
     I3_Metal ->
      HVM
     I3_XLarge ->
      HVM
     M1_Large ->
      Paravirtual
     M1_Medium ->
      Paravirtual
     M1_Small ->
      Paravirtual
     M1_XLarge ->
      Paravirtual
     M2_2XLarge ->
      Paravirtual
     M2_4XLarge ->
      Paravirtual
     M2_XLarge ->
      Paravirtual
     M3_2XLarge ->
      HVM
     M3_Large ->
      HVM
     M3_Medium ->
      HVM
     M3_XLarge ->
      HVM
     M4_10XLarge ->
      HVM
     M4_16XLarge ->
      HVM
     M4_2XLarge ->
      HVM
     M4_4XLarge ->
      HVM
     M4_Large ->
      HVM
     M4_XLarge ->
      HVM
     M5_12XLarge ->
      HVM
     M5_24XLarge ->
      HVM
     M5_2XLarge ->
      HVM
     M5_4XLarge ->
      HVM
     M5_Large ->
      HVM
     M5_XLarge ->
      HVM
     M5d_12XLarge ->
      HVM
     M5d_24XLarge ->
      HVM
     M5d_2XLarge ->
      HVM
     M5d_4XLarge ->
      HVM
     M5d_Large ->
      HVM
     M5d_XLarge ->
      HVM
     P2_16XLarge ->
      HVM
     P2_8XLarge ->
      HVM
     P2_XLarge ->
      HVM
     P3_16XLarge ->
      HVM
     P3_2XLarge ->
      HVM
     P3_8XLarge ->
      HVM
     R3_2XLarge ->
      HVM
     R3_4XLarge ->
      HVM
     R3_8XLarge ->
      HVM
     R3_Large ->
      HVM
     R3_XLarge ->
      HVM
     R4_16XLarge ->
      HVM
     R4_2XLarge ->
      HVM
     R4_4XLarge ->
      HVM
     R4_8XLarge ->
      HVM
     R4_Large ->
      HVM
     R4_XLarge ->
      HVM
     R5_12XLarge ->
      HVM
     R5_16XLarge ->
      HVM
     R5_24XLarge ->
      HVM
     R5_2XLarge ->
      HVM
     R5_4XLarge ->
      HVM
     R5_8XLarge ->
      HVM
     R5_Large ->
      HVM
     R5_Metal ->
      HVM
     R5_XLarge ->
      HVM
     R5d_12XLarge ->
      HVM
     R5d_16XLarge ->
      HVM
     R5d_24XLarge ->
      HVM
     R5d_2XLarge ->
      HVM
     R5d_4XLarge ->
      HVM
     R5d_8XLarge ->
      HVM
     R5d_Large ->
      HVM
     R5d_Metal ->
      HVM
     R5d_XLarge ->
      HVM
     T1_Micro ->
      HVM
     T2_2XLarge ->
      HVM
     T2_Large ->
      HVM
     T2_Medium ->
      HVM
     T2_Micro ->
      HVM
     T2_Nano ->
      HVM
     T2_Small ->
      HVM
     T2_XLarge ->
      HVM
     X1_16XLarge ->
      HVM
     X1_32XLarge ->
      HVM
     X1e_16XLarge ->
      HVM
     X1e_2XLarge ->
      HVM
     X1e_32XLarge ->
      HVM
     X1e_4XLarge ->
      HVM
     X1e_8XLarge ->
      HVM
     X1e_XLarge ->
      HVM
     Z1d_12XLarge ->
      HVM
     Z1d_2XLarge ->
      HVM
     Z1d_3XLarge ->
      HVM
     Z1d_6XLarge ->
      HVM
     Z1d_Large ->
      HVM
     Z1d_XLarge ->
      HVM


renderMismiInstanceType :: MismiInstanceType -> Text
renderMismiInstanceType m =
  case m of
    C1_Medium ->
      "c1.medium"
    C1_XLarge ->
      "c1.xlarge"
    C3_2XLarge ->
      "c3.2xlarge"
    C3_4XLarge ->
      "c3.4xlarge"
    C3_8XLarge ->
      "c3.8xlarge"
    C3_Large ->
      "c3.large"
    C3_XLarge ->
      "c3.xlarge"
    C4_2XLarge ->
      "c4.2xlarge"
    C4_4XLarge ->
      "c4.4xlarge"
    C4_8XLarge ->
      "c4.8xlarge"
    C4_Large ->
      "c4.large"
    C4_XLarge ->
      "c4.xlarge"
    C5_18XLarge ->
      "c5.18xlarge"
    C5_2XLarge ->
      "c5.2xlarge"
    C5_4XLarge ->
      "c5.4xlarge"
    C5_9XLarge ->
      "c5.9xlarge"
    C5_Large ->
      "c5.large"
    C5_XLarge ->
      "c5.xlarge"
    C5d_18XLarge ->
      "c5d.18xlarge"
    C5d_2XLarge ->
      "c5d.2xlarge"
    C5d_4XLarge ->
      "c5d.4xlarge"
    C5d_9XLarge ->
      "c5d.9xlarge"
    C5d_Large ->
      "c5d.large"
    C5d_XLarge ->
      "c5d.xlarge"
    CC1_4XLarge ->
      "cc1.4xlarge"
    CC2_8XLarge ->
      "cc2.8xlarge"
    CG1_4XLarge ->
      "cg1.4xlarge"
    CR1_8XLarge ->
      "cr1.8xlarge"
    D2_2XLarge ->
      "d2.2xlarge"
    D2_4XLarge ->
      "d2.4xlarge"
    D2_8XLarge ->
      "d2.8xlarge"
    D2_XLarge ->
      "d2.xlarge"
    F1_16XLarge ->
      "f1.16xlarge"
    F1_2XLarge ->
      "f1.2xlarge"
    G2_2XLarge ->
      "g2.2xlarge"
    G2_8XLarge ->
      "g2.8xlarge"
    G3_16XLarge ->
      "g3.16xlarge"
    G3_4XLarge ->
      "g3.4xlarge"
    G3_8XLarge ->
      "g3.8xlarge"
    H1_16XLarge ->
      "h1.16xlarge"
    H1_2XLarge ->
      "h1.2xlarge"
    H1_4XLarge ->
      "h1.4xlarge"
    H1_8XLarge ->
      "h1.8xlarge"
    HI1_4XLarge ->
      "hi1.4xlarge"
    HS1_8XLarge ->
      "hs1.8xlarge"
    I2_2XLarge ->
      "i2.2xlarge"
    I2_4XLarge ->
      "i2.4xlarge"
    I2_8XLarge ->
      "i2.8xlarge"
    I2_XLarge ->
      "i2.xlarge"
    I3_16XLarge ->
      "i3.16xlarge"
    I3_2XLarge ->
      "i3.2xlarge"
    I3_4XLarge ->
      "i3.4xlarge"
    I3_8XLarge ->
      "i3.8xlarge"
    I3_Large ->
      "i3.large"
    I3_Metal ->
      "i3.metal"
    I3_XLarge ->
      "i3.xlarge"
    M1_Large ->
      "m1.large"
    M1_Medium ->
      "m1.medium"
    M1_Small ->
      "m1.small"
    M1_XLarge ->
      "m1.xlarge"
    M2_2XLarge ->
      "m2.2xlarge"
    M2_4XLarge ->
      "m2.4xlarge"
    M2_XLarge ->
      "m2.xlarge"
    M3_2XLarge ->
      "m3.2xlarge"
    M3_Large ->
      "m3.large"
    M3_Medium ->
      "m3.medium"
    M3_XLarge ->
      "m3.xlarge"
    M4_10XLarge ->
      "m4.10xlarge"
    M4_16XLarge ->
      "m4.16xlarge"
    M4_2XLarge ->
      "m4.2xlarge"
    M4_4XLarge ->
      "m4.4xlarge"
    M4_Large ->
      "m4.large"
    M4_XLarge ->
      "m4.xlarge"
    M5_12XLarge ->
      "m5.12xlarge"
    M5_24XLarge ->
      "m5.24xlarge"
    M5_2XLarge ->
      "m5.2xlarge"
    M5_4XLarge ->
      "m5.4xlarge"
    M5_Large ->
      "m5.large"
    M5_XLarge ->
      "m5.xlarge"
    M5d_12XLarge ->
      "m5d.12xlarge"
    M5d_24XLarge ->
      "m5d.24xlarge"
    M5d_2XLarge ->
      "m5d.2xlarge"
    M5d_4XLarge ->
      "m5d.4xlarge"
    M5d_Large ->
      "m5d.large"
    M5d_XLarge ->
      "m5d.xlarge"
    P2_16XLarge ->
      "p2.16xlarge"
    P2_8XLarge ->
      "p2.8xlarge"
    P2_XLarge ->
      "p2.xlarge"
    P3_16XLarge ->
      "p3.16xlarge"
    P3_2XLarge ->
      "p3.2xlarge"
    P3_8XLarge ->
      "p3.8xlarge"
    R3_2XLarge ->
      "r3.2xlarge"
    R3_4XLarge ->
      "r3.4xlarge"
    R3_8XLarge ->
      "r3.8xlarge"
    R3_Large ->
      "r3.large"
    R3_XLarge ->
      "r3.xlarge"
    R4_16XLarge ->
      "r4.16xlarge"
    R4_2XLarge ->
      "r4.2xlarge"
    R4_4XLarge ->
      "r4.4xlarge"
    R4_8XLarge ->
      "r4.8xlarge"
    R4_Large ->
      "r4.large"
    R4_XLarge ->
      "r4.xlarge"
    R5_12XLarge ->
      "r5.12xlarge"
    R5_16XLarge ->
      "r5.16xlarge"
    R5_24XLarge ->
      "r5.24xlarge"
    R5_2XLarge ->
      "r5.2xlarge"
    R5_4XLarge ->
      "r5.4xlarge"
    R5_8XLarge ->
      "r5.8xlarge"
    R5_Large ->
      "r5.large"
    R5_Metal ->
      "r5.metal"
    R5_XLarge ->
      "r5.xlarge"
    R5d_12XLarge ->
      "r5d.12xlarge"
    R5d_16XLarge ->
      "r5d.16xlarge"
    R5d_24XLarge ->
      "r5d.24xlarge"
    R5d_2XLarge ->
      "r5d.2xlarge"
    R5d_4XLarge ->
      "r5d.4xlarge"
    R5d_8XLarge ->
      "r5d.8xlarge"
    R5d_Large ->
      "r5d.large"
    R5d_Metal ->
      "r5d.metal"
    R5d_XLarge ->
      "r5d.xlarge"
    T1_Micro ->
      "t1.micro"
    T2_2XLarge ->
      "t2.2xlarge"
    T2_Large ->
      "t2.large"
    T2_Medium ->
      "t2.medium"
    T2_Micro ->
      "t2.micro"
    T2_Nano ->
      "t2.nano"
    T2_Small ->
      "t2.small"
    T2_XLarge ->
      "t2.xlarge"
    X1_16XLarge ->
      "x1.16xlarge"
    X1_32XLarge ->
      "x1.32xlarge"
    X1e_16XLarge ->
      "x1e.16xlarge"
    X1e_2XLarge ->
      "x1e.2xlarge"
    X1e_32XLarge ->
      "x1e.32xlarge"
    X1e_4XLarge ->
      "x1e.4xlarge"
    X1e_8XLarge ->
      "x1e.8xlarge"
    X1e_XLarge ->
      "x1e.xlarge"
    Z1d_12XLarge ->
      "z1d.12xlarge"
    Z1d_2XLarge ->
      "z1d.2xlarge"
    Z1d_3XLarge ->
      "z1d.3xlarge"
    Z1d_6XLarge ->
      "z1d.6xlarge"
    Z1d_Large ->
      "z1d.large"
    Z1d_XLarge ->
      "z1d.xlarge"


parseMismiInstanceType :: Text -> Maybe MismiInstanceType
parseMismiInstanceType m =
  case m of
    "c1.medium" ->
      Just C1_Medium
    "c1.xlarge" ->
      Just C1_XLarge
    "c3.2xlarge" ->
      Just C3_2XLarge
    "c3.4xlarge" ->
      Just C3_4XLarge
    "c3.8xlarge" ->
      Just C3_8XLarge
    "c3.large" ->
      Just C3_Large
    "c3.xlarge" ->
      Just C3_XLarge
    "c4.2xlarge" ->
      Just C4_2XLarge
    "c4.4xlarge" ->
      Just C4_4XLarge
    "c4.8xlarge" ->
      Just C4_8XLarge
    "c4.large" ->
      Just C4_Large
    "c4.xlarge" ->
      Just C4_XLarge
    "c5.18xlarge" ->
      Just C5_18XLarge
    "c5.2xlarge" ->
      Just C5_2XLarge
    "c5.4xlarge" ->
      Just C5_4XLarge
    "c5.9xlarge" ->
      Just C5_9XLarge
    "c5.large" ->
      Just C5_Large
    "c5.xlarge" ->
      Just C5_XLarge
    "c5d.18xlarge" ->
      Just C5d_18XLarge
    "c5d.2xlarge" ->
      Just C5d_2XLarge
    "c5d.4xlarge" ->
      Just C5d_4XLarge
    "c5d.9xlarge" ->
      Just C5d_9XLarge
    "c5d.large" ->
      Just C5d_Large
    "c5d.xlarge" ->
      Just C5d_XLarge
    "cc1.4xlarge" ->
      Just CC1_4XLarge
    "cc2.8xlarge" ->
      Just CC2_8XLarge
    "cg1.4xlarge" ->
      Just CG1_4XLarge
    "cr1.8xlarge" ->
      Just CR1_8XLarge
    "d2.2xlarge" ->
      Just D2_2XLarge
    "d2.4xlarge" ->
      Just D2_4XLarge
    "d2.8xlarge" ->
      Just D2_8XLarge
    "d2.xlarge" ->
      Just D2_XLarge
    "f1.16xlarge" ->
      Just F1_16XLarge
    "f1.2xlarge" ->
      Just F1_2XLarge
    "g2.2xlarge" ->
      Just G2_2XLarge
    "g2.8xlarge" ->
      Just G2_8XLarge
    "g3.16xlarge" ->
      Just G3_16XLarge
    "g3.4xlarge" ->
      Just G3_4XLarge
    "g3.8xlarge" ->
      Just G3_8XLarge
    "h1.16xlarge" ->
      Just H1_16XLarge
    "h1.2xlarge" ->
      Just H1_2XLarge
    "h1.4xlarge" ->
      Just H1_4XLarge
    "h1.8xlarge" ->
      Just H1_8XLarge
    "hi1.4xlarge" ->
      Just HI1_4XLarge
    "hs1.8xlarge" ->
      Just HS1_8XLarge
    "i2.2xlarge" ->
      Just I2_2XLarge
    "i2.4xlarge" ->
      Just I2_4XLarge
    "i2.8xlarge" ->
      Just I2_8XLarge
    "i2.xlarge" ->
      Just I2_XLarge
    "i3.16xlarge" ->
      Just I3_16XLarge
    "i3.2xlarge" ->
      Just I3_2XLarge
    "i3.4xlarge" ->
      Just I3_4XLarge
    "i3.8xlarge" ->
      Just I3_8XLarge
    "i3.large" ->
      Just I3_Large
    "i3.metal" ->
      Just I3_Metal
    "i3.xlarge" ->
      Just I3_XLarge
    "m1.large" ->
      Just M1_Large
    "m1.medium" ->
      Just M1_Medium
    "m1.small" ->
      Just M1_Small
    "m1.xlarge" ->
      Just M1_XLarge
    "m2.2xlarge" ->
      Just M2_2XLarge
    "m2.4xlarge" ->
      Just M2_4XLarge
    "m2.xlarge" ->
      Just M2_XLarge
    "m3.2xlarge" ->
      Just M3_2XLarge
    "m3.large" ->
      Just M3_Large
    "m3.medium" ->
      Just M3_Medium
    "m3.xlarge" ->
      Just M3_XLarge
    "m4.10xlarge" ->
      Just M4_10XLarge
    "m4.16xlarge" ->
      Just M4_16XLarge
    "m4.2xlarge" ->
      Just M4_2XLarge
    "m4.4xlarge" ->
      Just M4_4XLarge
    "m4.large" ->
      Just M4_Large
    "m4.xlarge" ->
      Just M4_XLarge
    "m5.12xlarge" ->
      Just M5_12XLarge
    "m5.24xlarge" ->
      Just M5_24XLarge
    "m5.2xlarge" ->
      Just M5_2XLarge
    "m5.4xlarge" ->
      Just M5_4XLarge
    "m5.large" ->
      Just M5_Large
    "m5.xlarge" ->
      Just M5_XLarge
    "m5d.12xlarge" ->
      Just M5d_12XLarge
    "m5d.24xlarge" ->
      Just M5d_24XLarge
    "m5d.2xlarge" ->
      Just M5d_2XLarge
    "m5d.4xlarge" ->
      Just M5d_4XLarge
    "m5d.large" ->
      Just M5d_Large
    "m5d.xlarge" ->
      Just M5d_XLarge
    "p2.16xlarge" ->
      Just P2_16XLarge
    "p2.8xlarge" ->
      Just P2_8XLarge
    "p2.xlarge" ->
      Just P2_XLarge
    "p3.16xlarge" ->
      Just P3_16XLarge
    "p3.2xlarge" ->
      Just P3_2XLarge
    "p3.8xlarge" ->
      Just P3_8XLarge
    "r3.2xlarge" ->
      Just R3_2XLarge
    "r3.4xlarge" ->
      Just R3_4XLarge
    "r3.8xlarge" ->
      Just R3_8XLarge
    "r3.large" ->
      Just R3_Large
    "r3.xlarge" ->
      Just R3_XLarge
    "r4.16xlarge" ->
      Just R4_16XLarge
    "r4.2xlarge" ->
      Just R4_2XLarge
    "r4.4xlarge" ->
      Just R4_4XLarge
    "r4.8xlarge" ->
      Just R4_8XLarge
    "r4.large" ->
      Just R4_Large
    "r4.xlarge" ->
      Just R4_XLarge
    "r5.12xlarge" ->
      Just R5_12XLarge
    "r5.16xlarge" ->
      Just R5_16XLarge
    "r5.24xlarge" ->
      Just R5_24XLarge
    "r5.2xlarge" ->
      Just R5_2XLarge
    "r5.4xlarge" ->
      Just R5_4XLarge
    "r5.8xlarge" ->
      Just R5_8XLarge
    "r5.large" ->
      Just R5_Large
    "r5.metal" ->
      Just R5_Metal
    "r5.xlarge" ->
      Just R5_XLarge
    "r5d.12xlarge" ->
      Just R5d_12XLarge
    "r5d.16xlarge" ->
      Just R5d_16XLarge
    "r5d.24xlarge" ->
      Just R5d_24XLarge
    "r5d.2xlarge" ->
      Just R5d_2XLarge
    "r5d.4xlarge" ->
      Just R5d_4XLarge
    "r5d.8xlarge" ->
      Just R5d_8XLarge
    "r5d.large" ->
      Just R5d_Large
    "r5d.metal" ->
      Just R5d_Metal
    "r5d.xlarge" ->
      Just R5d_XLarge
    "t1.micro" ->
      Just T1_Micro
    "t2.2xlarge" ->
      Just T2_2XLarge
    "t2.large" ->
      Just T2_Large
    "t2.medium" ->
      Just T2_Medium
    "t2.micro" ->
      Just T2_Micro
    "t2.nano" ->
      Just T2_Nano
    "t2.small" ->
      Just T2_Small
    "t2.xlarge" ->
      Just T2_XLarge
    "x1.16xlarge" ->
      Just X1_16XLarge
    "x1.32xlarge" ->
      Just X1_32XLarge
    "x1e.16xlarge" ->
      Just X1e_16XLarge
    "x1e.2xlarge" ->
      Just X1e_2XLarge
    "x1e.32xlarge" ->
      Just X1e_32XLarge
    "x1e.4xlarge" ->
      Just X1e_4XLarge
    "x1e.8xlarge" ->
      Just X1e_8XLarge
    "x1e.xlarge" ->
      Just X1e_XLarge
    "z1d.12xlarge" ->
      Just Z1d_12XLarge
    "z1d.2xlarge" ->
      Just Z1d_2XLarge
    "z1d.3xlarge" ->
      Just Z1d_3XLarge
    "z1d.6xlarge" ->
      Just Z1d_6XLarge
    "z1d.large" ->
      Just Z1d_Large
    "z1d.xlarge" ->
      Just Z1d_XLarge
    _ ->
      Nothing


