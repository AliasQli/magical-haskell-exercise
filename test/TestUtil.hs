{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE ScopedTypeVariables  #-}
{-# LANGUAGE TypeApplications     #-}
{-# LANGUAGE UndecidableInstances #-}

module TestUtil where


import Control.DeepSeq ( force, NFData )
import Control.Exception
import Test.QuickCheck
import Test.QuickCheck.Monadic

data NamedProperty = Name String Property

class TestEquality a where
  (=?) :: a -> a -> Property

instance (Eq a, Show a, NFData a) => TestEquality a where
  a =? b = monadicIO $ do
    let spoon x = try @SomeException (evaluate (force x))
    ea <- run (spoon a)
    eb <- run (spoon b)
    case (ea, eb) of
      (Right a, Right b) | a /= b       
                         -> fail $ "Output " ++ show a ++ ", should be " ++ show b
      (Left e , Right _) -> run (throwIO e)
      (Right _, Left _ ) -> fail "Should throw an error"
      _                  -> pure ()

instance {-# OVERLAPPING #-} (Arbitrary x, Show x, TestEquality a) => TestEquality (x -> a) where
  fa =? fb = forAll arbitrary (\x -> fa x =? fb x)
