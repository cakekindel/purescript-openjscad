module Test.Data.Cad.Transform where

import Prelude
import Data.Cad.Transform
import Test.Spec.Assertions (shouldEqual)
import Test.Spec (describe, it)

transformSpec =
  describe
    "Transform"
    do itSemi
       itEq
       itShow

itShow =
  it
    "is Show"
    do (show $ X 0.0) `shouldEqual` "X 0.0"
       (show $ Y 0.0) `shouldEqual` "Y 0.0"
       (show $ Z 0.0) `shouldEqual` "Z 0.0"
       (show $ ThreeDim 1.0 2.0 3.0) `shouldEqual` "ThreeDim 1.0 2.0 3.0"

itEq =
  it
    "is Eq"
    do (X 0.0) `shouldEqual` X 0.0
       (Y 0.0) `shouldEqual` Y 0.0
       (Z 0.0) `shouldEqual` Z 0.0
       (ThreeDim 0.0 0.0 0.0) `shouldEqual` ThreeDim 0.0 0.0 0.0

itSemi =
  it
    "is Semigroup"
    do (X 1.0 <> X 2.0) `shouldEqual` X 3.0
       (X 1.0 <> Y 2.0) `shouldEqual` ThreeDim 1.0 2.0 0.0
       (X 1.0 <> Z 2.0) `shouldEqual` ThreeDim 1.0 0.0 2.0
       (Y 1.0 <> X 2.0) `shouldEqual` ThreeDim 2.0 1.0 0.0
       (Y 1.0 <> Y 2.0) `shouldEqual` Y 3.0
       (Y 1.0 <> Z 2.0) `shouldEqual` ThreeDim 0.0 1.0 2.0
       (Z 1.0 <> X 2.0) `shouldEqual` ThreeDim 2.0 0.0 1.0
       (Z 1.0 <> Y 2.0) `shouldEqual` ThreeDim 0.0 2.0 1.0
       (Z 1.0 <> Z 2.0) `shouldEqual` Z 3.0
       (X 1.0 <> ThreeDim 0.0 0.0 0.0) `shouldEqual` ThreeDim 1.0 0.0 0.0
       (Y 1.0 <> ThreeDim 0.0 0.0 0.0) `shouldEqual` ThreeDim 0.0 1.0 0.0
       (Z 1.0 <> ThreeDim 0.0 0.0 0.0) `shouldEqual` ThreeDim 0.0 0.0 1.0
       (ThreeDim 0.0 0.0 0.0 <> X 1.0) `shouldEqual` ThreeDim 1.0 0.0 0.0
       (ThreeDim 0.0 0.0 0.0 <> Y 1.0) `shouldEqual` ThreeDim 0.0 1.0 0.0
       (ThreeDim 0.0 0.0 0.0 <> Z 1.0) `shouldEqual` ThreeDim 0.0 0.0 1.0
       (ThreeDim 1.0 2.0 3.0 <> ThreeDim 4.0 5.0 6.0) `shouldEqual`
         ThreeDim 5.0 7.0 9.0
