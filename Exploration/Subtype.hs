module Exploration.Subtype where

-- | Simple subtyping relation. It may not
--   be up to theoretical par, but its really
--   all that I want when I think of a Subtype.
--   The laws are:
--      forall f : b -> a
--      a = b => f (embed a) = f (embed b)
class a <: b where
  embed_ :: Embedding a b

embed0 :: (a <: b) => a -> b
embed0 a = case embed_ of
  E0 f -> f a

embed1 :: (a <: b) => a x -> b x
embed1 a = case embed_ of
  E1 f -> f a

embed2 :: (a <: b) => a x y -> b x y
embed2 a = case embed_ of
  E2 f -> f a

embed3 :: (a <: b) => a x y z -> b x y z
embed3 a = case embed_ of
  E3 f -> f a

embed4 :: (a <: b) => a x y z q -> b x y z q
embed4 a = case embed_ of
  E4 f -> f a

-- | Here I used the same hack as in Subhask.
-- | Template Haskell might be able to make this
-- | locally more attractive, but I'll just have
-- | to see how its going.
data family Embedding (a :: k) (b :: k)
newtype instance Embedding (a :: *) (b :: *)
  = E0 (a -> b)
newtype instance Embedding (a :: k -> *) (b :: k -> *)
  = E1 (forall x. a x -> b x)
newtype instance Embedding (a :: k -> j -> *) (b :: k -> j -> *)
  = E2 (forall x y. a x y -> b x y)
newtype instance Embedding (a :: k -> j -> i -> *) (b :: k -> j -> i -> *)
  = E3 (forall x y z. a x y z -> b x y z)
newtype instance Embedding (a :: k -> j -> i -> l -> *) (b :: k -> j -> i -> l -> *)
  = E4 (forall x y z q. a x y z q -> b x y z q)
