module Ch03.Answer where

import Ch03.Definition

import Prelude (Int, Bool(..), (+), (>), undefined)

-- Sum up a list.
-- e.g. sumList [1,2,3] = 6
-- Hint: (+) :: Int -> Int -> Int
sumList :: [Int] -> Int
sumList []     = 0
sumList (x:xs) = x + sumList xs

-- Return the biggest number in a list.
-- e.g. maxList [1,4,5,3] = 5
-- Hint: (>) :: Int -> Int -> Bool
maxList :: [Int] -> Int
maxList []     = undefined
maxList [x]    = x
maxList (x:xs) = let m = maxList xs
                 in  if m > x then m else x

-- Append two lists.
-- e.g. appendList [1,2,3] [4,5,6] = [1,2,3,4,5,6]
appendList :: [a] -> [a] -> [a]
appendList []     ys = ys
appendList (x:xs) ys = x : (appendList xs ys)

-- Reverse a list.
-- e.g. reverseList [1,2,3] = [3,2,1]
reverseList :: [a] -> [a]
reverseList xs = appendListRev xs []
  where
    appendListRev [] ys = ys
    appendListRev (x:xs) ys = appendListRev xs (x:ys)

-- Addition on natural numbers.
add :: Nat -> Nat -> Nat
add Z     n = n
add (S m) n = S (add m n)

-- Multiplication on natural numbers.
mult :: Nat -> Nat -> Nat
mult Z     _ = Z
mult (S m) n = add (mult m n) n
