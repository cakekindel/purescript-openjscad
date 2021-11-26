module Data.Cad.Modeling.Primitives ( cube
                                    , cube_
                                    , CubeOptions
                                    , cylinder
                                    , cylinder_
                                    , CylinderOptions
                                    , ellipse
                                    , ellipse_
                                    , EllipseOptions
                                    ) where

import Prelude

import Data.Maybe (Maybe(..))

import Data.Cad (Geom2, Geom3, Coords2, Pair(..), pairToArray)

type CubeOptions = {size :: Int}
type CylinderOptions = {height :: Number, radius :: Number, segments :: Int}
type EllipseOptions = {center :: Coords2, radius :: Pair Number, segments :: Int}

type CubeOptsRaw = CubeOptions
type CylOptsRaw = CylinderOptions
type EllipseOptsRaw = {center :: Array Number, radius :: Array Number, segments :: Int}

ellipseOptsRaw :: EllipseOptions -> EllipseOptsRaw
ellipseOptsRaw {center, radius, segments} = { center: pairToArray center
                                            , radius: pairToArray radius
                                            , segments: segments
                                            }

cubeOptsRaw :: CubeOptions -> CubeOptsRaw
cubeOptsRaw = identity

cylOptsRaw :: CylinderOptions -> CylOptsRaw
cylOptsRaw = identity

foreign import cubeRaw     :: CubeOptsRaw -> Geom3
foreign import cylinderRaw :: CylOptsRaw -> Geom3
foreign import ellipseRaw  :: EllipseOptsRaw -> Geom2

cube :: CubeOptions -> Geom3
cube = cubeOptsRaw >>> cubeRaw

cylinder :: CylinderOptions -> Geom3
cylinder = cylOptsRaw >>> cylinderRaw

ellipse :: EllipseOptions -> Geom2
ellipse = ellipseOptsRaw >>> ellipseRaw

cube_ :: Geom3
cube_ = cube {size: 1}

cylinder_ :: Geom3
cylinder_ = cylinder {height: 1.0, radius: 1.0, segments: 64}

ellipse_ :: Geom2
ellipse_ = ellipse {center: Pair 0.0 0.0, radius: Pair 1.0 1.0, segments: 64}
