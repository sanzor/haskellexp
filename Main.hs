module Main where
    import Jlib
    import Put
    import Data.Typeable

    import System.Environment

    out="data.txt"
    -- <-Used only for actions ( IO ,else use let if expression)
    main::IO String
    main=do
         let val=renderJValue sample
         writeFile out val
         return ("From HS MAIN:"++val)
       -- writeFile "data.txt" values
       -- return $ length values
        

    renderIO::String->IO String
    renderIO st>>=putStrLn

   
        
