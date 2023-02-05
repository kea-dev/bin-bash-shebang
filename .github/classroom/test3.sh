#!/bin/bash

# Test if the fix-samples.sh exist and does what it should
if [ -x fix-samples.sh ]
then
 ./fix-samples.sh

  echo "Hoping not to find for './samples/animals/countries/.apes.txt'"
  cat ./samples/animals/countries/.apes.txt && exit 255

  echo "Looking for './samples/countries/Germany.txt'"
  cat ./samples/countries/Germany.txt || exit 255

  exit 0
else
  echo "There is no executable file named 'fix-samples.sh'"
  exit 255
fi
