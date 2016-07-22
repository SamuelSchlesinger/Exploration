module Exploration.Category.Monoidal where

import Exploration.Category.Definition
import Exploration.Category.Functor

-- | Placeholder, I don't like it this way
class (Category cat, ValidCategory cat (TUnit cat))
  => Monoidal cat where
  type Tensor cat :: k -> k -> k
  tensor :: (ValidCategory cat a, ValidCategory cat b)
         => cat a (cat b (Tensor cat a b))
  type TUnit cat :: k
  tunit :: proxy cat -> TUnit cat
