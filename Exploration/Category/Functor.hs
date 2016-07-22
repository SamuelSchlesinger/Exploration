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

class (Category c, Category d) => CovariantFunctor (f :: k -> i) (c :: k -> k -> *) (d :: i -> i -> *) where
  mapCov :: c a b -> d (f a) (f b)

class (Category c, Category d) => ContravariantFunctor (f :: k -> i) (c :: k -> k -> *) (d :: i -> i -> *) where
  mapContra :: c a b -> d (f b) (f a)

instance CovariantFunctor [] (->) (->) where
  mapCov f []     = []
  mapCov f (x:xs) = f x : mapCov f xs

type CovariantEndoFunctor f c = CovariantFunctor f c c
type ContravariantEndoFunctor f c = ContravariantFunctor f c c

-- | The type of Functor typically used in Haskell code
type Functor f = CovariantEndoFunctor f (->)

infixr 0 <$>
(<$>) :: Functor f => (a -> b) -> f a -> f b
(<$>) = mapCov

infixr 0 <$!>
(<$!>) :: Functor f => (a -> b) -> f a -> f b
f <$!> x = let !x' = x in f <$> x
