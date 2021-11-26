module Data.Cad where

import Prelude

type Coords2 = Pair Number
type Coords3 = Tri  Number

data Pair a = Pair a a
data Tri  a = Tri  a a a

pairToArray :: forall a. Pair a -> Array a
pairToArray (Pair x y) = [x, y]

triToArray :: forall a. Tri a -> Array a
triToArray (Tri x y z) = [x, y, z]

foreign import data Geom  :: Type
foreign import data Geom2 :: Type
foreign import data Geom3 :: Type
foreign import data Line2 :: Type
foreign import data Line3 :: Type
foreign import data Mat4  :: Type
foreign import data Path2 :: Type
foreign import data Plane :: Type
foreign import data Poly2 :: Type
foreign import data Poly3 :: Type
foreign import data Slice :: Type
foreign import data Vec2  :: Type
foreign import data Vec3  :: Type
foreign import data Vec4  :: Type
foreign import data Bezier :: Type
