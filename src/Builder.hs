{-# LANGUAGE TupleSections #-}

module Builder 
(buildGogen)
where

import CustomTypes
import Control.Comonad.Env (EnvT(..), ask)
import Control.Comonad.Store (Store, store, peek, pos, seek)

resourcesLocation :: FilePath
-- resourcesLocation = "~/Code/Hask/projects/gogen/src/"
resourcesLocation = "/Users/jwj/Code/Hask/projects/gogen/src/"

buildGogen :: IO (GogenGrid)
buildGogen = do 
    inputWords <- fmap lines $ readFile (resourcesLocation ++ "words.txt")
    letters    <- fmap lines $ readFile (resourcesLocation ++ "letters.txt")
    return (makeGrid letters inputWords)


-- default to 5 x 5 grid
makeGrid :: [String] -> InputWords -> GogenGrid
makeGrid ss words = EnvT ((5, 5), words) (store (\(x, y) -> (ss !! y) !! x) (0, 0))







    
