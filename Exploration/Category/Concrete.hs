module Exploration.Category.Concrete where

import Exploration.Category.Definition
import Exploration.Category.Functor
import Exploration.Subtype

-- | A concrete category is one with a faithful
-- functor to Set.
type Concrete cat = cat <: (->)

-- | It was tripping me up that ($) in Subhask
-- was defined as this, but I like the idea,
-- because it basically overloads application.
infixr 0 @*
(@*) :: Concrete c => c a b -> a -> b
(@*) = embed2
