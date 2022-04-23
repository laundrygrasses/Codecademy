#!/bin/bash

echo "Welcome to this build script!"

firstline=$(head -n 1 source/changelog.md)

read -a splitfirstline <<< $firstline

version=${splitfirstline[1]}

echo "This is building version" $version

echo "Do you want to continue? (Enter '1' for yes, '0' for no)"

read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo "OK"

  for filename in source/*
  do
    if [ $filename == "source/secretinfo.md" ]
    then
      echo "Not copying" $filename
    else
      echo "Copying" $filename
      cp $filename build/.
    fi
  done

else
  echo "Please come back when you are ready."
fi

cd build
echo "Build version $version contains the following files:"
ls
cd ..
