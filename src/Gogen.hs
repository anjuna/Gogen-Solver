
module Gogen where

import CustomTypes




up :: GogenGrid a -> GogenGrid a
up GogenGrid (ns f) = >






setNodeVal :: Node -> Char -> Node
setNodeVal (Node k Nothing) x = Node k (Just x)
setNodeVal n _ = n

-- [Maybe Node] -> 
findNodeFromChar :: GogenGrid -> Char -> Maybe Node
findNodeFromChar (GogenGrid (n:ns)) c = if Just c == getNodeChar n then Just n else findNodeFromChar (GogenGrid ns) c
findNodeFromChar (GogenGrid []) _ = Nothing

findNodeFromPosition :: GogenGrid -> Position -> Maybe Node
findNodeFromPosition (GogenGrid (n:ns)) p = if p == getPosition n then Just n else findNodeFromPosition (GogenGrid ns) p
findNodeFromPosition (GogenGrid []) _ = Nothing

addPosition :: Position -> Position -> Position
addPosition (Position x1 y1) (Position x2 y2) = Position (x1 + x2) (y1 + y2)


-- Find all positions of nodes that differ in both coordinates by exactly 1
getConnected :: Node -> GogenGrid -> [Node]
getConnected n grid = concat $ map (findNodes grid n) possibleAlterations
            where 
                possibleAlterations = [Position (-1) 0, Position 1 0, Position 0 (-1), Position 0 1, Position (-1) (-1), Position 1 (-1), Position (-1) 1, Position 1 1]
                findNodes :: GogenGrid -> Node -> Position -> [Node]
                findNodes (GogenGrid ns f) n pos = let newPos = pos `addPosition` getPosition n
                                    in case findNodeFromPosition grid newPos of 
                                Nothing -> []
                                Just m -> [m]




    
    
    
    
    