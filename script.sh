echo "Compiling Haskell program"
ghc -c Prettify.hs
ghc -c PrettyJson.hs
ghc -c SimpleJson.hs
ghc -c PutJson.hs
ghc -c Main.hs

ghc -o Main Main.o PrettyJson.o Prettify.o SimpleJson.o PutJson.o 
