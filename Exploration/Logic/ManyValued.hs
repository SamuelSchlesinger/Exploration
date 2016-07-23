module Exploration.Logic.ManyValued where

-- | A Many Valued logic is an algebraic
-- | structure (m, (^), not, false), satisfying:
--        (^) associative, commutative
--        false neutral to (^)
--        not (not x) = x
--        x ^ (not false) = not false
--        not (not x ^ y) ^ y = not (not y ^ x) ^ x
class ManyValued m where
  (<+>) :: m -> m -> m
  false :: m
  not :: m -> m
