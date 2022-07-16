module Main where

import qualified Ch03.Exercise as Ch03
import qualified Ch03.Test     as Ch03

import Control.Monad
import System.Exit
import Test.QuickCheck

import TestUtil

isPass :: Result -> Bool
isPass Success{} = True
isPass _         = False

check :: NamedProperty -> IO ()
check (Name name p) = do
  putStrLn $ "Testing " ++ name
  r <- quickCheckResult p
  unless (isPass r) exitFailure

delim :: String -> String
delim title = replicate 10 '-' ++ " " ++ title ++ " " ++ replicate 10 '-'

main :: IO ()
main = do
  when Ch03.finished $ do
    putStrLn (delim "Chapter 3")
    mapM_ check Ch03.tests
