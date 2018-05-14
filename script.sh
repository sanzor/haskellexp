echo "Compiling Haskell program"
ghc -c Jlib.hs
ghc -c Main.hs
ghc -o Main Main.o Jlib.o
ghci