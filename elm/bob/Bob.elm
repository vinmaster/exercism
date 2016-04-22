module Bob where

import String
import Char exposing (isDigit)

type SentenceType
  = Question
  | Yelling
  | Silence
  | Other

hey : String -> String
hey sentence =
  let
    categorizedSentence = categorizeSentence sentence
  in
    case categorizedSentence of
      Question -> "Sure."
      Yelling -> "Whoa, chill out!"
      Silence -> "Fine. Be that way!"
      Other -> "Whatever."

categorizeSentence : String -> SentenceType
categorizeSentence str =
  if str |> String.trim |> String.isEmpty then
    Silence
  else if (hasChar str) && (str |> String.toUpper |> (==) str) then
    Yelling
  else if str |> String.right 1 |> (==) "?" then
    Question
  else
    Other

hasChar : String -> Bool
hasChar str =
  str |> String.any isChar

isChar : Char -> Bool
isChar c =
  Char.isUpper c || Char.isLower c
