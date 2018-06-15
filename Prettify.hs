module Prettify where
    import Prelude hiding ((<>))
    
    data Doc=Empty 
             |Char Char
             |Text String
             |Line
             |Concat Doc Doc
             |Union Doc Doc
             deriving (Show,Eq)
             


    empty::Doc
    empty=Empty

    char::Char->Doc
    char =Char

    text::String->Doc
    text ""=Empty
    text str=Text str

    double::Double->Doc
    double val=text (show val)

    line::Doc
    line=Line

    (<>)::Doc->Doc->Doc
    (<>) Empty y=y
    (<>) y Empty=y
    (<>) y x=x `Concat` y


    
    

    punctuate::Doc->[Doc]->[Doc]
    punctuate p  []=[]
    punctuate p [d]=[d]
    punctuate p (d:ds)=(d <> p): punctuate p ds