module CustomTypes where

data Position = Position Int Int deriving (Show, Ord, Eq)

data Node = Node {getPosition :: Position, getNodeChar :: Maybe Char} deriving (Show, Ord, Eq)

-- easier for looking up
-- type GogenGrid = Map.Map Position Node

data GogenGrid = GogenGrid [Node] deriving (Show)

type InputWords = [String]