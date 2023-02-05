#!/bin/bash

# Test if the setup-samples.sh exist and does what it should
if [ -x setup-samples.sh ]
then
 ./setup-samples.sh

  echo "Looking for './samples/animals/countries/.apes.txt'"
  cat ./samples/animals/countries/.apes.txt || exit 255

  echo "Looking for './samples/animals/Elephant babies.txt'"
  cat "./samples/animals/Elephant babies.txt" || exit 255

  exit 0
else
  echo "There is no executable file named 'setup-samples.sh'"
  exit 255
fi
