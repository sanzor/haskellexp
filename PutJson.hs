module PutJson where

    renderJValue::JValue->String
    renderJValue (JString s)=show s
    renderJValue (JBool True)="True"
    renderJValue(JBool False)="False"
    renderJValue JNull="Null"
    