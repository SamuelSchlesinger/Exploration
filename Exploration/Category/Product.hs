{-# LANGUAGE ScopedTypeVariables, FlexibleContexts #-}

module Exploration.Category.Product where

import Exploration.Category.Definition

type family Fst a where
  Fst (a, b) = a

type family Snd a where
  Snd (a, b) = b

newtype Product c d a b = Product (c (Fst a) (Fst b), d (Snd a) (Snd b))

instance (Category c, Category d) => Category (Product c d) where
  type ValidCategory (Product c d) a
    = (ValidCategory c (Fst a), ValidCategory d (Snd a))
  id = Product (id, id)
  Product (a, b) . Product (f, g) = Product ((a . f) , (b . g))

newtype Clockwise c d a b = Clockwise (c (Fst a) (Fst b), d (Snd b) (Snd a))

instance (Category c, Category d) => Category (Clockwise c d) where
  type ValidCategory (Clockwise c d) a
    = (ValidCategory c (Fst a), ValidCategory d (Snd a)) 
  id = Clockwise (id, id)
  Clockwise (a, b) . Clockwise (f, g) = Clockwise ((a . f), (g . b))

newtype CounterClockwise c d a b = CounterClockwise (c (Fst b) (Fst a), d (Snd a) (Snd b))
 
instance (Category c, Category d) => Category (CounterClockwise c d) where
  type ValidCategory (CounterClockwise c d) a
    = (ValidCategory c (Fst a), ValidCategory d (Snd a))
  id = CounterClockwise (id, id)
  CounterClockwise (a, b) . CounterClockwise (f, g) = CounterClockwise ((f . a), (b . g))

newtype UpsideDown c d a b = UpsideDown (c (Fst b) (Fst a), d (Snd b) (Snd a))

instance (Category c, Category d) => Category (UpsideDown c d) where
  type ValidCategory (UpsideDown c d) a
    = (ValidCategory c (Fst a), ValidCategory d (Snd a))
  id = UpsideDown (id, id)
  UpsideDown (a, b) . UpsideDown (f, g) = UpsideDown (f . a, g . b)
