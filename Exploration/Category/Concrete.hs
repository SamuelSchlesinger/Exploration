module Exploration.Category.Concrete where

import Exploration.Category.Definition
import Exploration.Category.Functor
import Exploration.Subtype

-- | A concrete category is one with a faithful
-- functor to Set.
type Concrete cat = cat <: (->)

infixr 0 |$|
(|$|) :: Concrete c => c a b -> a -> b
(|$|) = embed2
