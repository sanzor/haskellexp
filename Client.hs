module Client where


    data Client=ClientInfo{
        clientType::ClientType,
        balance::Double

    } deriving (Show,Eq,Ord)

    data ClientInfo=Info{
        name::String,
        wage::Double,
        yearRegistered::Int
    }deriving (Show,Eq,Ord)

    data ClientType=  Usual ClientInfo 
                    | Premium ClientInfo Int 
                    | Golden ClientInfo String
                    deriving (Show,Eq,Ord)
    

    
        
        
