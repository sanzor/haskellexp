module Prettyify where

    data Doc=Empty 
             |Char Char
             |Text String
             |Line
             |Concat Doc Doc
             |Union Doc Doc
             deriving (Show,Eq)
             

    punctuate::[Doc]->[Doc]->[Doc]
    punctuate p  []=[]
    punctuate p [d]=[d]
    punctuate p (d:ds)=d<>p: punctuate p ds