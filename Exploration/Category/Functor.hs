module Exploration.Category.Functor 
(
    CovariantFunctor(..)
  , ContravariantFunctor(..)
  , CovariantEndoFunctor(..)
  , ContravariantEndoFunctor(..)
  , Functor(..)
) where

import Exploration.Category.Definition
import Data.Constraint

-- | A covariant functor from category c -> category d
-- is a mapping f from objects of c to objects
-- of d, as well as a mapping fmap from arrows
-- of c into arrows of d.

class (Category c, Category d) => CovariantFunctor f c d where
  mapCov :: a `c` b -> f a `d` f b

class (Category c, Category d) => ContravariantFunctor f c d where
  mapContra :: a `c` b -> f b `d` f a

instance CovariantFunctor [] (->) (->) where
  mapCov f []     = []
  mapCov f (x:xs) = f x : mapCov f xs

type CovariantEndoFunctor f c = CovariantFunctor f c c
type ContravariantEndoFunctor f c = ContravariantFunctor f c c

-- | The type of Functor typically used in Haskell code
type Functor f = CovariantEndoFunctor f (->)
