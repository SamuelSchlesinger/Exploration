module Exploration.Algebra.Lattice.Definition where

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
