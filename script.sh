echo "Compiling Haskell program"
ghc -c Jlib.hs
ghc -c Main.hs
ghc -c Put.hs
ghc -o Main Main.o Jlib.o Put.o
