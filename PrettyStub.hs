module PrettyStub where

    data Doc=ToBeDefined deriving (Show)

    (<>)::Doc->Doc->Doc
    a <> b =undefined

    string::String->Doc
    string = enclose "" hcat . map 

    text::String->Doc
    text str=undefined

    double::Double->Doc
    double num=undefined

    char::Char->Doc
    char c=undefined

    hcat::[Doc]->Doc
    hcat ls=undefined
    
    fsep::[Doc]->Doc
    fsep xs=undefined
