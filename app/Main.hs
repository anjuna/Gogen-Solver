module Main where

import Builder
import PrettyPrinter

main :: IO ()
main = do  
    grid <- buildGogen
    putStrLn $ prettyPrintGogen grid


