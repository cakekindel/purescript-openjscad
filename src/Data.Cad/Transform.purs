module Data.Cad.Transform (scale2, scale3, translate2, translate3, Transform(..)) where

import Prelude

import Data.Foldable (foldl)
import Data.Cad (Geom2, Geom3)

foreign import translate2Raw :: Array Number -> Geom2 -> Geom2
foreign import translate3Raw :: Array Number -> Geom3 -> Geom3

foreign import scale2Raw :: Array Number -> Geom2 -> Geom2
foreign import scale3Raw :: Array Number -> Geom3 -> Geom3

translate2 :: Transform -> Geom2 -> Geom2
translate2 t g = translate2Raw (transformToArray t) g

translate3 :: Transform -> Geom3 -> Geom3
translate3 t g = translate3Raw (transformToArray t) g

scale2 :: Transform -> Geom2 -> Geom2
scale2 t g = scale2Raw (transformToArray t) g

scale3 :: Transform -> Geom3 -> Geom3
scale3 t g = scale3Raw (transformToArray t) g

data Transform = X Number | Y Number | Z Number | ThreeDim Number Number Number

transformToArray :: Transform -> Array Number
transformToArray (ThreeDim x y z) = [x, y, z]
transformToArray o = transformToArray $ toThreeDim o

toThreeDim :: Transform -> Transform
toThreeDim (X x) = ThreeDim x   0.0 0.0
toThreeDim (Y y) = ThreeDim 0.0 y   0.0
toThreeDim (Z z) = ThreeDim 0.0 0.0 z
toThreeDim o = o

instance eqTransform :: Eq Transform where
  eq a b = transformToArray a == transformToArray b

instance showTransform :: Show Transform where
  show (X x) = "X " <> show x
  show (Y x) = "Y " <> show x
  show (Z x) = "Z " <> show x
  show (ThreeDim x y z) = "ThreeDim"<>([x,y,z] <#> show # foldl (\b a -> b<>" "<>a) "")

instance semiTransform :: Semigroup Transform where
  append   (X x)   (X x') = X (x + x')
  append   (Y y)   (Y y') = Y (y + y')
  append   (Z z)   (Z z') = Z (z + z')
  append x@(X _) y@(Y _)  = x <> toThreeDim y
  append x@(X _) z@(Z _)  = x <> toThreeDim z
  append y@(Y _) x@(X _)  = x <> y
  append y@(Y _) z@(Z _)  = y <> toThreeDim z
  append z@(Z _) x@(X _)  = x <> z
  append z@(Z _) y@(Y _)  = y <> z
  append x@(X _) t@(ThreeDim _ _ _) = (toThreeDim x) <> t
  append y@(Y _) t@(ThreeDim _ _ _) = (toThreeDim y) <> t
  append z@(Z _) t@(ThreeDim _ _ _) = (toThreeDim z) <> t
  append t@(ThreeDim _ _ _) x@(X _) = x <> t
  append t@(ThreeDim _ _ _) y@(Y _) = y <> t
  append t@(ThreeDim _ _ _) z@(Z _) = z <> t
  append   (ThreeDim x y z) (ThreeDim x' y' z') = ThreeDim (x + x') (y + y') (z + z')
