module PrettyJson(renderJValue) where
    
    import Numeric (showHex)
    import Data.Char (ord) 
    import Data.Bits (shiftR, (.&.))

    import Jlib(JValue(..))
    import Prettify(Doc,(<>),
    char,
    double,
    fsep,
    hcat,
    punctuate,
    text,
    compact,
    pretty)


    --text,double and string provided by Prettify moudle.
    
    renderJValue::JValue->Doc
    renderJValue (JBool True)=text "true"
    renderJValue (JBool False)=text "false"
    renderJValue JNull=text "null"
    renderJValue (JNumber num)=text double num
    renderJValue (JString str)=string str



  --Private methods  to support renderJValue


    enclose::Char->Char->Doc->Doc
    enclose begin end input=char begin <> input <> char <> end

    oneChar::Char->Doc
    oneChar c= case lookup c simpleEscapes of
                Just value->text value 
                Nothing  | mustEscape c ->hexEscape c
                         | otherwise  ->char c
                where 
                mustEscape c=c <' ' || c=='\x7f' || c > '\xff'
                simpleEscapes pairs=zipWith (\x y->(x,['\\',y])) "\b\n\f\r\t\\/" "bnfrt\\/"
                
    hexEscape::Char->Doc
    hexEscape c | d<0x10000=smallHex c
                |otherwise astral (d-0x10000)
                where d=ord c

    smallHex::Int->Doc
    smallHex nr= text "\\u" 
                 <> text (replicate (4-length h) '0')
                 <> text h 
      where
        h=showHex x ""

    astral :: Int -> Doc 
    astral n = smallHex (a + 0xd800) <> smallHex (b + 0xdc00)    
         where a = (n `shiftR` 10) .&. 0x3ff      
               b = n .&. 0x3ff 
    
    series::Char->Char->(a->Doc)->[a]->Doc
    series open close item=enclose open close
                         . fsep . punctuate(char ',') . map item
 