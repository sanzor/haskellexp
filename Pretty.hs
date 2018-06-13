module Pretty where

    import Jlib
    import Numeric

    data Doc=ToBeDefined deriving (Show)

    (<>)::Doc->Doc->Doc
    a <>b =undefined

    string::String->Doc
    string = enclose "" hcat . map 

    text::String->Doc
    text str=undefined

    double::Double->Doc
    double num=undefined

    enclose::Char->Char->Doc->Doc
    enclose begin end input=char begin <> input <> char <> end


    char::Char->Doc
    char c=undefined

    hcat::[Doc]->Doc
    hcat ls=undefined

    oneChar::Char->Doc
    oneChar c= case lookup c simpleEscapes of
                Just value->text value 
                Nothing  | mustEscape c ->hexEscape c
                         |otherwise  ->char c
                where mustEscape c=c <' ' || c=='\x7f' || c > '\xff'

                simpleEscapes::[(Char,String)]
                simpleEscapes pairs=zipWDERIVINith (\x y->(x,['\\',y])) "\b\n\f\r\t\\/" "bnfrt\\/"
                
                
    simpleEscapes::[(Char,String)]
    simpleEscapes=zipWith ch "\b\n\f\r\t\\"

    hexEscape::Char->Doc
    hexEscape c | d<0x10000=smallHex c
                |otherwise astral 

    smallHex::Int->Doc
    smallHex nr=text "\\u" <> text (replicate (4-length h) '0') <> text h where
        h=showHex x ""

    astral :: Int -> Doc 
    astral n = smallHex (a + 0xd800) <> smallHex (b + 0xdc00)    
         where a = (n `shiftR` 10) .&. 0x3ff      
               b = n .&. 0x3ff 
    
    series::Char->Char->(a->Doc)->[a]->Doc
    series open close item=enclose open close . fsep . punctuate(char ',') . map item
 