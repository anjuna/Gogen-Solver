module PrettyPrinter where


import CustomTypes
import Control.Comonad.Env (EnvT(..), ask)
import Control.Comonad.Store (Store, store, peek, pos, seek)

-- type GogenGrid = EnvT (Dimensions, InputWords) (Store Position) Char

prettyPrintGogen :: GogenGrid -> String
prettyPrintGogen g = let
    (dims, _) = ask g
    (maxX, maxY) = (fst dims - 1, snd dims - 1)
    in [peek (x, y) g | x <- [0..maxX], y <- [0..maxY]]