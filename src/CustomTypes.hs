module CustomTypes where

data Position = Position Int Int deriving (Show, Ord, Eq)

instance Num Position where
    (+) (Position x1 y1) (Position x2 y2) = Position (x1 + x2) (y1 + y2)

data Node = Node {getPosition :: Position, getNodeChar :: Maybe Char} deriving (Show, Ord, Eq)

-- easier for looking up
-- type GogenGrid = Map.Map Position Node

data GogenGrid = GogenGrid [Node] deriving (Show)

type InputWords = [String]