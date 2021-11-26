module Test.Data.Cad where

import Prelude
import Data.Cad
import Test.Spec.Assertions (shouldEqual)
import Test.Spec (describe, it)

pairSpec = describe "Pair" do
             describe "toArray" do
               it "should convert Pair Int -> Array Int" do
                 let pair = Pair 1 2
                 let arr = pairToArray pair
                 arr `shouldEqual` [1, 2]

triSpec = describe "Tri" do
            describe "toArray" do
              it "should convert Tri Int -> Array Int" do
                let tri = Tri 1 2 3
                let arr = triToArray tri
                arr `shouldEqual` [1, 2, 3]
