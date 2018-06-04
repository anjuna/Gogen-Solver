
module Solver(
    up
) where

import CustomTypes
import Control.Comonad.Env (EnvT(..), ask)
import Control.Comonad.Store (Store, store, peek, pos, seek)

up :: GogenGrid -> Maybe GogenGrid
up g = let 
        (x, y) = pos g
      in if y > 0 then Just (seek (x, y - 1) g) else Nothing  

right :: GogenGrid -> Maybe GogenGrid
right g = let 
        ((maxX, maxY), _) = ask g
        (x, y) = pos g
    in if x < maxX then Just (seek (x + 1, y) g) else Nothing  




    
    
    
    
    