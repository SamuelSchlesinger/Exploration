module Exploration.Algebra.Associative.Definition where

-- | An associative operation.
class Semigroup s where
  (<>) :: s -> s -> s

-- | An associative operation
-- with a neutral element.
class Monoid m where
  (++) :: m -> m -> m
  empty :: m

instance Monoid [a] where
  [] ++ n = n
  (a:as) ++ n = a : (as ++ n)
  empty = []
