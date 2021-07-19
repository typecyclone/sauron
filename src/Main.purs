module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Node.ChildProcess (defaultSpawnOptions, spawn, stdout)
import Node.Stream (onData)
import Node.Buffer as Buffer
import Node.Encoding as Encoding

foreign import addListener :: forall a. a -> String -> (String -> Effect Unit) -> Effect Unit

foreign import createWatcher :: forall a. String -> Effect a

main :: Effect Unit
main = do
  _ <- spawn "hs" [] defaultSpawnOptions
  watcher <- createWatcher "src"
  addListener watcher "change" ø

ø :: String -> Effect Unit
ø _ = do
  elm <- spawn "elm" [ "make", "src/Main.elm", "--output", "public/elm.js" ] defaultSpawnOptions
  onData (stdout elm) (Buffer.toString Encoding.UTF8 >=> log)
  pure unit
