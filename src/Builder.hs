module Builder 
(buildGogen)
where

import System.IO
import CustomTypes

buildGogen :: IO (GogenGrid, InputWords)
buildGogen = do 
    letters <- fmap lines readFile "letters.txt"
    words <- fmap lines readFile "words.txt"
    return (makeGrid letters, InputWords words)

makeGrid :: String -> GogenGrid
makeGrid s = let broken = unlines


    
