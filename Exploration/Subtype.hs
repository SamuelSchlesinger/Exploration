module Exploration.Subtype where

-- | Simple subtyping relation. It may not
--   be up to theoretical par, but its really
--   all that I want when I think of a Subtype.
--   The laws are:
--      forall f : b -> a
--      a = b => f (embed a) = f (embed b)
class a <: b where
  embed :: a -> b
-- ^ TODO:
--   Extend and learn more about the theory behind
--   this.
