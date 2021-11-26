module Data.Cad.Modeling.Booleans (subtract3, intersect3) where

import Data.Cad (Geom3)

foreign import subtract3  :: Geom3 -> Geom3 -> Geom3
foreign import intersect3 :: Geom3 -> Geom3 -> Geom3
