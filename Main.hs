module Main where
    import Jlib 
    import System.Environment

    main::IO()
    main=print(JObject[("p0",JNumber 3),("p1",JString "asta")])

    -- main::IO()
    -- main =
    --     do
    --     args<-getArgs
    --     case args of
    --        [x,y] ->pt x
    --        _ -> putStrLn "2 args needed"
    --     putStrLn (JObject[("prop1",JNumber 1),("prop2",JString "two")])
        
    -- pt::String->IO()
    -- pt  []= error "String empty back off"
    -- pt  xs@(_:_:xs')=putStrLn . concat ["List with chopped:",xs',"\r\nList without:",xs]
