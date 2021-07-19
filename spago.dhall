{ name = "my-project"
, dependencies =
  [ "console"
  , "effect"
  , "node-buffer"
  , "node-child-process"
  , "node-streams"
  , "prelude"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
