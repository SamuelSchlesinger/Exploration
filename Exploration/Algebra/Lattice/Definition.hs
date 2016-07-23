module Exploration.Algebra.Lattice.Definition where

import Exploration.Basics

-- | The operation must be associative,
-- | commutative, and idempotent.
class SemiLattice l where
  (\^/) :: l -> l -> l

-- | Both operations must be able to commute
-- | and associate freely, and the two absorbtion
-- | laws must hold:
--      a \/ (a /\ b) = a
--      a /\ (a \/ b) = a
class Lattice l where
  (\/) :: l -> l -> l
  (/\) :: l -> l -> l

-- | These two elements must play along with
-- | the lattice operations in the following
-- | way:
--      a \/ bottom = a
--      a /\ top    = a
class Lattice l => BoundedLattice l where
  top :: l
  bottom :: l

-- | A Heyting Algebra is a Bounded lattice
-- | accompanied by a compatible ordering
-- | along with a binary "implication" operator,
-- | such that:
--      c/\a<=b if and only if c<=a ==> b
-- Logically speaking, this is the weakest rule
-- such thta modus ponens is sound (said Wikipedia)
class Heyting alg where
  (==>) :: alg -> alg -> alg

implies :: Heyting alg => alg -> alg -> alg
implies = (==>)

instance Lattice Bool where
  False \/ False = False
  _     \/ _     = True
  True  /\ True  = True
  _     /\ _     = False

instance BoundedLattice Bool where
  top = True
  bottom = False

instance Heyting Bool where
  False ==> True = False
  _     ==> _    = True
