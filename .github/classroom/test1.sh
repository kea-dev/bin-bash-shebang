#!/bin/bash

# Make sure that the sample files are not comitted to the repo
if [ -d ./samples ]
then
  echo "The directory 'samples' is checked in - that's a mistake"
  exit 1
else
  echo "Fine. No 'samples' is checked in to the repo!"
fi