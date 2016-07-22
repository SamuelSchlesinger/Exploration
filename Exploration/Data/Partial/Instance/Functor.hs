module Exploration.Data.Partial.Instance.Functor where

import Exploration.Data.Partial.Definition
import Exploration.Template.Functor
import Exploration.Category.Functor

$(mkFunctor [t|Partial|] [|partialMap|])
