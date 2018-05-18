module Jlib(
    JValue(..),
    getString,
    getInt,
    getBool,
    getObject,
    getArray
) where

    data JValue=JString String
                |JNumber Double
                |JBool Bool
                |JNull
                |JObject [(String,JValue)]
                |JArray [JValue]
                deriving (Eq,Ord,Show)
    
    getString::JValue->Maybe String
    getString (JString s)=Just s
    getString _=Nothing

    getInt::JValue->Maybe Int
    getInt (JNumber n)=Just (truncate n)
    getInt _= Nothing

    getBool::JValue->Maybe Bool
    getBool (JBool b)=Just b
    getBool _=Nothing

    getObject (JObject obj)=Just obj
    getObject _=Nothing

    getArray (JArray a)=Just a
    getArray _=Nothing

    

    
