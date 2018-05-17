module Main where
    import Jlib
    import Put
    import Data.Typeable

    import System.Environment

    out="data.txt"

    main::IO String
    main=do
         let val=renderJValue sample
         writeFile out val
         return ("From HS MAIN:"++val)
       -- writeFile "data.txt" values
       -- return $ length values
        


   
        
