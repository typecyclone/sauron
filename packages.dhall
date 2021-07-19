let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.14.3-20210716/packages.dhall sha256:1f9af624ddfd5352455b7ac6df714f950d499e7e3c6504f62ff467eebd11042c

in upstream
  with common-utils =
    { dependencies = [ "effect", "node-fs", "prelude", "node-process", "easy-ffi" ]
    , repo = "https://github.com/rajatsharma/purescript-common-utils.git"
    , version = "e6be7d819dd1044087e3c59e63e1866bfdf33c60"
    }
