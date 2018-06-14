module Stuff where
lkup::String->[(String,b)]->Int
lkup elem pairs=case lookup elem pairs of
                    Just r -> 1
                    Nothing  | length elem ==2 -> 2
                             | otherwise -> 3

f::Int->Int->Int->Int
f=((.).(.))(+)(+)
