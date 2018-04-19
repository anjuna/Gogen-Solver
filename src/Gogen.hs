
module Gogen where

import CustomTypes

setNodeVal :: Node -> Char -> Node
setNodeVal (Node k Nothing) x = Node k (Just x)
setNodeVal n _ = n

-- [Maybe Node] -> 
findNodeFromChar :: GogenGrid -> Char -> Maybe Node
findNodeFromChar (GogenGrid (n:ns)) c = if Just c == getNodeChar n then Just n else findNodeFromChar (GogenGrid ns) c
findNodeFromChar (GogenGrid []) _ = Nothing

findNodeFromPosition :: GogenGrid -> Position -> Maybe Node
findNodeFromPosition (GogenGrid (n:ns)) p = if p == getPosition n then Just n else findNodeFromPosition (GogenGrid ns) p
findNodeFromPosition (GogenGrid []) p = Nothing


-- Find all positions of nodes that differ in both coordinates by exactly 1
getConnected :: Node -> GogenGrid -> [Node]
getConnected n grid = concat $ map (findNodes grid n) possibleAlterations
            where 
                possibleAlterations = [Position (-1) 0, Position 1 0, Position 0 (-1), Position 0 1, Position (-1) (-1), Position 1 (-1), Position (-1) 1, Position 1 1]
                findNodes :: GogenGrid -> Node -> Position -> [Node]
                findNodes (GogenGrid ns) n pos = let newPos = pos + getPosition n
                                    in case findNodeFromPosition grid newPos of 
                                Nothing -> []
                                Just m -> [m]





-- findMinimalPathsBetweenNodes :: GogenGrid -> Node -> Node -> 


buildNodePath :: GogenGrid -> Node -> Int -> [Node]
buildNodePath grid n 0 = [n]
buildNodePath grid n 1 = [n]


-- Might want to think about building a grid based on dimensions of the grid, rather than specifying positions here
-- feels like it's open to integrity issues



grid = GogenGrid [node00, node01, node02, node10, node11, node12, node20, node21, node22]



inputWords :: [String]
inputWords = ["AND"]

gogenMain :: IO ()
gogenMain = putStrLn "yo m8"


    
    
    
    
    