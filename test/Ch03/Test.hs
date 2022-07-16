{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications   #-}

module Ch03.Test where

import           Ch03.Definition
import qualified Ch03.Exercise as Q
import qualified Ch03.Answer   as A

import GHC.Generics
import Control.DeepSeq
import Test.QuickCheck

import TestUtil

deriving instance Eq Nat
deriving instance Generic Nat
instance NFData Nat
instance Arbitrary Nat where
  arbitrary = fmap toNat (arbitrary `suchThat` (>= 0))
    where
      toNat :: Integer -> Nat
      toNat 0 = Z
      toNat n = S (toNat (n-1))

tests :: [NamedProperty]
tests = 
  [ Name "sumList"     $ Q.sumList     =? A.sumList
  , Name "maxList"     $ Q.maxList     =? A.maxList
  , Name "appendList"  $ Q.appendList  =? A.appendList  @Int 
  , Name "reverseList" $ Q.reverseList =? A.reverseList @Int
  , Name "add"         $ Q.add         =? A.add
  , Name "mult"        $ Q.mult        =? A.mult
  ]
