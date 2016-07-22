module Exploration.Basics 
(
-- Combinators
  flip,
  const,
 
-- Data types
  Bool(..),
  Int(..),
  Integer(..),
  Float(..),
  Double(..),
  module Data.Word
) where

import Prelude (Integer(..), Bool(..), Int(..), Float(..), Double(..))
import Data.Word

flip  = \f x y -> f y x
const = \x y   -> x

infixr 0 $
($) :: (a -> b) -> a -> b
f $ x = f x

infixr 0 $!
($!) :: (a -> b) -> a -> b
f $! x = let !x' = x in f x'
