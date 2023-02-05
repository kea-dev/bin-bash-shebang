#!/bin/bash

# Looking for a .gitignore file and testing if it keeps the working dir clean
if [ -e .gitignore ] 
then

  if [ -z "$(git status --porcelain)" ]; then
    echo "Working directory is clean"
  else
    echo "Our test made working Directory dirty"
    exit 1
  fi

else
  echo "There is no executable file named '.gitignore'"
  exit 255
fi
