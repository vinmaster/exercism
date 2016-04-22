module HelloWorld (..) where

import String


helloWorld : Maybe String -> String
helloWorld name =
  case name of
    Just str -> String.concat ["Hello, ", str, "!"]
    Nothing -> "Hello, World!"

