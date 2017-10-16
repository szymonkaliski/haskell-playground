# Experiments with GLOSS and Diagrams

## Diagrams - auto-reload workflow

1. `main = do renderToFile "out.svg" width diagram`
2. `nodemon -e hs -x runhaskell file.hs`
3. `npx vmd out.svg`
