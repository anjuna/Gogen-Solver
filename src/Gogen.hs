
module Gogen where

import qualified Data.Map as Map
    

data Position = Position Int Int deriving (Show, Ord, Eq)

instance Num Position where
    (+) (Position x1 y1) (Position x2 y2) = Position (x1 + x2) (y1 + y2)

data Node = Node {getPosition :: Position, getNodeChar :: Maybe Char} deriving (Show, Ord, Eq)

setNodeVal :: Node -> Char -> Node
setNodeVal (Node k Nothing) x = Node k (Just x)
setNodeVal n _ = n

-- easier for looking up
-- type GogenGrid = Map.Map Position Node
data GogenGrid = GogenGrid [Node] deriving (Show)

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

node00 = Node (Position 0 0) $ Just 'a'
node01 = Node (Position 0 1) Nothing
node02 = Node (Position 0 2) $ Just 'd'

node10 = Node (Position 1 0) Nothing
node11 = Node (Position 1 1) $ Just 'a'
node12 = Node (Position 1 2) Nothing

node20 = Node (Position 2 0) $ Just 'a'
node21 = Node (Position 2 1) Nothing
node22 = Node (Position 2 2) $ Just 'a'


grid = GogenGrid [node00, node01, node02, node10, node11, node12, node20, node21, node22]



inputWords :: [String]
inputWords = ["AND"]

gogenMain :: IO ()
gogenMain = putStrLn "yo m8"


    
    
    
    
    