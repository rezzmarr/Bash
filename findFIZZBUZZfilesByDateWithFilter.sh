#!/bin/bash
 
#Can list as many folder names here as you want, separated by spaces
#for FOLDER in fold1 fold2 fold44 fold223; do 

BASEDIRECTORY='/home/stuff/' 
LOCALDIR='/home/rmarr/toResend/'
cd $BASEDIRECTORY

#Loop each directory/file in BASEDIRECTORY
for DIRECTORY in */ ; do
echo "$DIRECTORY"
SENTFOLDER="$BASEDIRECTORY$DIRECTORY""Sent/"
echo "$SENTFOLDER"

#Check if sent folder directory exists
if [ -d "$SENTFOLDER" ]; then
  echo 'Sent folder Found'
  cd $SENTFOLDER
  echo 'making $LOCALDIR$DIRECTORY'
  mkdir $LOCALDIR$DIRECTORY;
  echo "copying files with 'FIZZBUZZ' to $LOCALDIR$DIRECTORY"
  grep -lir FIZZBUZZ | xargs cp -p -t  "$LOCALDIR$DIRECTORY";
  cd "$LOCALDIR$DIRECTORY";
  echo "pwd/ = $(pwd)/";

  #checks if current directory is LOCALDIR/DIRECTORY, so that following commands are run in correct place
if [ "$(pwd)/" = "$LOCALDIR$DIRECTORY" ]; then
  #counts FIZZBUZZ files in directory
  echo "FIZZBUZZ files found before filtering =  $(grep -lir "FIZZBUZZ" | wc -l)"
  echo "Deleting FIZZWIZZ files";
  #removes FIZZWIZZ files
  grep -lir "FIZZWIZZ" | xargs rm;
  #removes files which don't contain "BOOP" (case insensitive tag -i)
  grep -Lir "BOOP" | xargs rm;
  echo "FIZZBUZZ found = $(grep -lir "FIZZBUZZ" | wc -l)";
  #echo "Removing FIZZBUZZ from before date";
  #creates a dummyfile with creation date 27/11/2018
  touch -t 201811270000 dummyfile;
  #deletes all files which are not newer than the dummy file
  find . -type f ! -newer dummyfile -delete;
  
  #delete all files which dont contain directory name inside file
  echo "Directory # = ${DIRECTORY/\//}"
  grep -Lir "${DIRECTORY/\//}" | xargs rm;
  
  #Final FIZZBUZZ count of extracted files
  echo "FIZZBUZZ files found after filtering = $(grep -lir "FIZZBUZZ" | wc -l)";
fi
fi
echo "" 
done
