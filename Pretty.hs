module Pretty where

    import Jlib

    data Doc=ToBeDefined deriving (Show)

    string::String->Doc
    string = enclose "" hcat . map 

    text::String->Doc
    text str=undefined

    double::Double->Doc
    double num=undefined

    enclose::Char->Char->Doc->Doc
    enclose begin end input=char begin <> input <> charend

    (<>)::Doc->Doc->Doc
    a <>b =undefined

    char::Char->Doc
    char c=undefined

    hcat::[Doc]->Doc
    hcat ls=undefined

    oneChar::Char->Doc
    oneChar c= case lookup c simpleEscapes of
                Just value->text value 
                Nothing  ->hexEscape c
                _ ->char c
                
    simpleEscapes::[(Char,String)]
    simpleEscapes=zipWith ch "\b\n\f\r\t\\""




 