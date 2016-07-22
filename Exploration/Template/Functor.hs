module Exploration.Template.Functor where

import Language.Haskell.TH
import Prelude

mkFunctor :: Q Type -> Q Exp -> Q [Dec]
mkFunctor tyQ expQ = do
  ty <- tyQ
  exp <- expQ
  pure [InstanceD
    []
    (AppT 
      (AppT 
        (AppT (ConT $ mkName "CovariantFunctor") ty)
              ArrowT) 
        ArrowT)
    [(FunD (mkName "mapCov") [Clause [] (NormalB exp) []])]]
