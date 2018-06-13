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
                    JString "Howdy"
                    ]

    renderJValue::JValue->String
    renderJValue (JString s)= s
    renderJValue (JNumber nr)=show nr
    renderJValue (JBool True)="True"
    renderJValue(JBool False)="False"
    renderJValue JNull="Null"
    renderJValue (JObject o)="{"++getObjData o++"}" where
            getObjData []=""
            getObjData ls=intercalate "," (map kvString ls)
            
    renderJValue (JArray arr)= "["++elements arr++"]" where
                                elements []=""
                                elements ls=intercalate "," (map renderJValue ls)


    kvString::(String,JValue)->String
    kvString ([],_)=""
    kvString (f,l)=f++":"++renderJValue l