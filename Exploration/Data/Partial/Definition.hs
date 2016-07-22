{-# LANGUAGE LambdaCase #-}

module Exploration.Data.Partial.Definition where

data Partial a = Defined a | Undefined

partial :: b -> (a -> b) -> Partial a -> b
partial b f a = case a of
  Defined a -> f a
  Undefined -> b 

partialMap :: (a -> b) -> Partial a -> Partial b
partialMap f (Defined a) = Defined (f a)
partialMap f Undefined   = Undefined
