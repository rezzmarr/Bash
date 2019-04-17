#!/bin/bash

BASEDIRECTORY='/home/directory/' 
REPORTFILE='/home/rmarr/Report.txt'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
cd $BASEDIRECTORY

echo "Directories Matching Grep!" > $REPORTFILE
for DIRECTORY in */ ; do
echo "$DIRECTORY"
SENTFOLDER="$BASEDIRECTORY$DIRECTORY""Sent/"
echo "$SENTFOLDER"

#Check if directory exists
if [ -d "$SENTFOLDER" ]; then
	
	  echo 'Sent folder Found'
	  cd $SENTFOLDER
	  echo "Searching for BUZZ followed by FIIZ or WIZZ, multiline grep"

			  #if grep -q "ILD=1+2\|ILD=2" *; then
			  if pcregrep -q -Mi "(?s)BUZZ(.*|\n)(FIZZ|WIZZ)" *; then
					echo -e "${GREEN}BUZZ*FIZZ or BUZZ*WIZZ found in $DIRECTORY !${NC}";
					echo "$DIRECTORY" >> $REPORTFILE
			else
					echo -e "${RED}not found${NC}"
			fi
		
fi
echo ""
done
