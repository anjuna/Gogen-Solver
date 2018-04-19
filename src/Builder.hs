{-# LANGUAGE TupleSections #-}

module Builder 
(buildGogen)
where

import System.IO
import CustomTypes

buildGogen :: IO (GogenGrid, InputWords)
buildGogen = do 
    letters <- fmap lines $ readFile "letters.txt"
    inputWords <- fmap lines $ readFile "words.txt"
    return (makeGrid letters, inputWords)

--Start at 0 0
makeGrid :: [String] -> GogenGrid
makeGrid ss = GogenGrid $ map toNode (toXYCoords ss)
    where 
        -- split the x and y into two functions??
          toXYCoords input = concat $ zipWith (\n ns -> map (n,) ns) [0..] (map (zip [0..]) input)
          toNode (y, (x, char)) = let val = case char of
                                    ' ' ->  Nothing
                                    c -> Just c
                                in Node (Position x y) val







    
