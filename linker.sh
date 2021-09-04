#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -l linkFile -d destFile"
   echo -e "\t-l Link File/Folder"
   echo -e "\t-b Target File/Folder"
   exit 1 # Exit script after printing help
}

while getopts "l:d:" opt
do
   case "$opt" in
      l ) linkFile="$OPTARG" ;;
      d ) destFile="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$linkFile" ] || [ -z "$destFile" ] 
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct

linkerFunction() {
	ln -sfn $1 $2
}


linkerFunction "$linkFile" "$destFile"
