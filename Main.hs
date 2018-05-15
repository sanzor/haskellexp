module Main where
    import Jlib
    import Put

    import System.Environment

    main::IO String
    main=do
        str<-renderJValue sample
        putStrLn str
        return "asta"
