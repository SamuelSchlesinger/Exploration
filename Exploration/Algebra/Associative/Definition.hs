module Exploration.Algebra.Associative.Definition where

-- | An associative operation.
class Semigroup s where
  (<>) :: s -> s -> s

-- | An associative operation
-- | with a neutral element.
class Monoid m where
  (++) :: m -> m -> m
  empty :: m

-- | A commutative Monoid.
-- | a ++ b = b ++ a
class Monoid m => Commutative m

-- | An associative operation
-- | with a neutral element
-- | as well as inverses.
class Group g where
  (&) :: g -> g -> g
  e   :: g
  inv :: g -> g

-- | A commutative (abelian) group.
class Group g => Abelian g

-- | A Ring r has two operations, +
-- | and *, and must be an abelian
-- | group in addition and a monoid under
-- | multiplication. Multiplication
-- | must also be distributive with
-- | respect to addition.
class (Monoid r, Group r, Abelian r) => Ring r

(+) :: Ring r => r -> r -> r
(+) = (&)
(*) :: Ring r => r -> r -> r
(*) = (++)

-- | A field is a ring, but the monoid
-- | is also an Abelian group
class (Commutative r, Ring r) => Field r

instance Monoid [a] where
  [] ++ n = n
  (a:as) ++ n = a : (as ++ n)
  empty = []
