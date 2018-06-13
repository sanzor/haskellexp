echo "Compiling Haskell program"
ghc -c Pretty.hs
ghc -c Jlib.hs
ghc -c Main.hs
ghc -c Put.hs
ghc -o Main Main.o Pretty.o Jlib.o Put.o 
