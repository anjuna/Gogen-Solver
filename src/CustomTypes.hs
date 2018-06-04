module CustomTypes where

import Control.Comonad.Env (EnvT(..))
import Control.Comonad.Store (Store)

-- easier for looking up
-- type GogenGrid = Map.Map Position Node

-- can turn this in to a Comonad instance??
type Position = (Int, Int)
type Dimensions = (Int, Int)
type InputWords = [String]
type GogenGrid = EnvT (Dimensions, InputWords) (Store Position) Char

-- maybe some sort of environment that is passed around

