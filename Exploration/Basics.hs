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
  Double(..)
) where

import Prelude (Integer(..), Bool(..), Int(..), Float(..), Double(..))

flip  = \f x y -> f y x
const = \x y   -> x
