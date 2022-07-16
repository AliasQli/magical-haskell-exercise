module Ch03.Exercise where

import Ch03.Definition

import Prelude(Int, Bool(..), (+), (>), undefined)

-- Sum up a list.
-- e.g. sumList [1,2,3] = 6
-- Hint: (+) :: Int -> Int -> Int
sumList :: [Int] -> Int
sumList = undefined

-- Return the biggest number in a list.
-- e.g. maxList [1,4,5,3] = 5
-- Hint: (>) :: Int -> Int -> Bool
maxList :: [Int] -> Int
maxList = undefined

-- Append two lists.
-- e.g. appendList [1,2,3] [4,5,6] = [1,2,3,4,5,6]
appendList :: [a] -> [a] -> [a]
appendList = undefined

-- Reverse a list.
-- e.g. reverseList [1,2,3] = [3,2,1]
reverseList :: [a] -> [a]
reverseList = undefined

-- Addition on natural numbers.
add :: Nat -> Nat -> Nat
add = undefined

-- Multiplication on natural numbers.
mult :: Nat -> Nat -> Nat
mult = undefined

-- Mark this as true when finished.
finished :: Bool
finished = False
