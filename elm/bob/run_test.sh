# USAGE "sh run_test.sh FILE_NAME"

elm-make $1 --output raw-test.js && sh elm-stuff/packages/laszlopandy/elm-console/1.1.1/elm-io.sh raw-test.js test.js && node test.js && rm raw-test.js test.js
