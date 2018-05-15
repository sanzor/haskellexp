module Put(
    renderJValue,
    sample
) where
    import Data.List
    import Jlib


    sample=JArray[
                    JObject [("name",JString "adita"),("age",JNumber 13)],
                    JObject [("name",JString "dan"),("kids",JNumber 3)] ,
                    JNumber 3,
                    JBool False,
                    JString "Simple String"
                    ]

    renderJValue::JValue->String
    renderJValue (JString s)=show s
    renderJValue (JBool True)="True"
    renderJValue(JBool False)="False"
    renderJValue JNull="Null"
    renderJValue (JObject o)="{"++getObjData o++"}" where
            getObjData []=""
            getObjData ls=intercalate "," (map kvString ls)
            
    
    kvString::(String,JValue)->String
    kvString (f,l)=f++":"++renderJValue l