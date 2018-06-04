module CustomTypes where

data Position = Position Int Int deriving (Show, Ord, Eq)

data Node = Node {getPosition :: Position, getNodeChar :: Maybe Char} deriving (Show, Ord, Eq)

-- easier for looking up
-- type GogenGrid = Map.Map Position Node

-- can turn this in to a Comonad instance??
data GogenGrid = GogenGrid {nodes ::[Node], focus :: Position} deriving (Show)

-- maybe some sort of environment that is passed around
type InputWords = [String]

