#!/bin/bash 
path="/D/Divyani/"
file= $path$1

if [ -f $file ]
then
echo "file exist $file "
else 
echo "file does not exist  " 
fi 