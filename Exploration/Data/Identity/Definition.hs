module Exploration.Data.Identity.Definition where

data Identity a = Identity a

identityMap f (Identity a) = Identity (f a)
