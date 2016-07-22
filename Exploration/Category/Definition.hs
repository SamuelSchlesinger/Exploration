module Exploration.Category.Definition where

import Data.Constraint
import Exploration.Basics

class Category (cat :: obj -> obj -> *) where
  type ValidCat cat (a :: obj) :: Constraint
  id :: ValidCat cat a => cat a a
  (.) :: cat b c -> cat a b -> cat a c

(>>>) :: Category cat => cat a b -> cat b c -> cat a c
(>>>) = flip (.)

(<<<) :: Category cat => cat b c -> cat a b -> cat a c
(<<<) = (.)

instance Category (->) where
  type ValidCat (->) a = ()
  id = \x -> x
  (f . g) x = f (g x)
