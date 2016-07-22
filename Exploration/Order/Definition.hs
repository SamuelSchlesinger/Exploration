{-# LANGUAGE TypeFamilies, KindSignatures, ScopedTypeVariables #-}

module Exploration.Order.Definition where

import Exploration.Basics
import Exploration.Data.Partial.Definition
import Exploration.Logic.Definition

type family Ordering a :: *

class Order o where
  compare :: o -> o -> Ordering o
  (>=) :: o -> o -> Logic o
  (>)  :: o -> o -> Logic o
  (<=) :: o -> o -> Logic o
  (<)  :: o -> o -> Logic o

data TotalOrdering = GT | EQ | LT
data PartialOrdering = Partial TotalOrdering

type instance Ordering (Classical a) = TotalOrdering
type instance Ordering (Partial a)   = Partial (Ordering a)
type instance Ordering (a -> b)      = a -> Ordering a
