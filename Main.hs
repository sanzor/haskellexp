module Main where
    import Jlib
    import Put
    import Data.Typeable

    import System.Environment

    main::IO()
    main=do
        values<-renderJValue sample
        fileWrite "data.txt" 
        print values
        


   
        
