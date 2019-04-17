#!/bin/bash
 
for FOLDER in fold1 fold2; do 
DIRECTORY="/nas/home/ediargosweb/$FOLDER/Sent/" 
LOCALDIR="/home/rmarr/$FOLDER" 
echo "CHECKING FILES FOR $FOLDER"

if [ -d $DIRECTORY ]; then
  echo "Directory for $FOLDER exists";
  cd $DIRECTORY;
  echo "making $LOCALDIR";
  mkdir $LOCALDIR;
  echo "copying invoices to $LOCALDIR"
  grep -lir FIZZBUZZ | xargs cp -p -t  $LOCALDIR;
  cd $LOCALDIR;

if [ "$(pwd)" = "$LOCALDIR" ]; then
  echo "FIZZBUZZ files found before filtering =  $(grep -lir "FIZZBUZZ" | wc -l)"
  echo "Deleting FIZZWIZZ files";
  grep -lir "FIZZWIZZ" | xargs rm;
  #delete files which don't contain BOOP
  grep -Lir "BOOP" | xargs rm;
  echo "FIZZBUZZ files found = $(grep -lir "FIZZBUZZ" | wc -l)";
  
  echo "Removing FIZZBUZZ files from before 01/11/18 and 01/02/19";
  touch -t 201811010000 dummyfile;
  find . -type f ! -newer dummyfile -delete;
  #Delete files newer than Feb 1st
  find . -newermt "Feb 1 00:00" -delete;
  echo "FIZZBUZZ files found after filtering = $(grep -lir "FIZZBUZZ" | wc -l)";
fi
fi
echo "" 
done
