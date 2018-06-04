{-# LANGUAGE TupleSections #-}

module Builder 
(buildGogen)
where

import CustomTypes

resourcesLocation :: FilePath
-- resourcesLocation = "~/Code/Hask/projects/gogen/src/"
resourcesLocation = "/Users/jwj/Code/Hask/projects/gogen/src/"

buildGogen :: IO (GogenGrid, InputWords)
buildGogen = do 
    letters <- fmap lines $ readFile (resourcesLocation ++ "letters.txt")
    inputWords <- fmap lines $ readFile (resourcesLocation ++ "words.txt")
    return (makeGrid letters, inputWords)

--Start at 0 0 in top left corner. Going right increments x coord, going down increments y coord
makeGrid :: [String] -> GogenGrid
makeGrid ss = GogenGrid (map toNode (toXYCoords ss)) (Position 0 0)
    where 
        -- split the x and y into two functions??
          toXYCoords input = concat $ zipWith (\n ns -> map (n,) ns) [0..] (map (zip [0..]) input)
          toNode (y, (x, char)) = let val = case char of ' ' ->  Nothing
                                                         c -> Just c
                                in Node (Position x y) val







    
