module Exploration.Logic.Definition where

import Exploration.Basics
import Data.Constraint

type family Logic a :: *

-- | An equivalence class defined over some type a.
class Eq a where
  (==) :: a -> a -> Logic a

type Boolean a = Logic a ~ Bool
type instance Logic Bool    = Bool
type instance Logic Int     = Bool
type instance Logic Integer = Bool
type instance Logic Float   = Bool

newtype Classical a = Classical a -- Forces a Boolean logic
type instance Logic (Classical a) = Bool

type instance Logic (a -> b) = a -> Logic b

type family a == b :: Bool where
  a == a = 'True
  a == b = 'False

type family IfElse (c :: Bool) (a :: Constraint) (b :: Constraint) where
  IfElse 'True a b  = a
  IfElse 'False a b = b

type family (c :: Bool) ? (a :: Constraint) :: Constraint where
  'True ? a   = a
  'False ? a  = ()
