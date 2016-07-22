module Exploration.Data.Identity.Instance.Functor where

import Exploration.Data.Identity.Definition
import Exploration.Category.Functor
import Exploration.Template.Functor

$(mkFunctor [t|Identity|] [|identityMap|])
