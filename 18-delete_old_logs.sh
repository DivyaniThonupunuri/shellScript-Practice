#!/bin/bash 

Source_directory="/D/Divyani/app-logs"
files_to_delete=$(find $Source_directory -name "*.log" -mtime +14)

while IFS= read -r filepath
do 
    rm -rf $filepath
done <<< $files_to_delete