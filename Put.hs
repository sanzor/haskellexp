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
    renderJValue (JObject o)="{"++kvpairs o++"}" where
                        kvpairs []= ""
                        kvpairs ls=intercalate "," (map renderPair ls) 
                        renderPair (k,v)=show k++":"++renderJValue v
    renderJValue (JArray a)="["++renderArr a++"]" where
                        renderArr []=""
                        renderArr arr=intercalate "," (map renderJValue arr)