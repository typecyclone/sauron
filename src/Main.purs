module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Node.ChildProcess (defaultSpawnOptions, spawn, stdout)
import Node.Stream (onData)
import Node.Buffer as Buffer
import Node.Encoding as Encoding
import CommonUtils.Node.FileOps (addListener, createWatcher)

main :: Effect Unit
main = do
  watcher <- createWatcher "src"
  addListener watcher "change" ø

ø :: String -> Effect Unit
ø _ = do
  elm <- spawn "elm" [ "make", "src/Main.elm", "--output", "public/elm.js" ] defaultSpawnOptions
  onData (stdout elm) (Buffer.toString Encoding.UTF8 >=> log)
  pure unit
