#!/bin/bash

file=$1

#check whether file exists 

if [ -f $file ]
then
    echo "file existis in the path $1"
else 
    echo "files does not exisit in the path $1 "
fi

#for reading line by line
#line is a variable
while IFS= read -r line ; 
do
#for splitting words by using space as dilimiter by default
#word is variable
    for word in $line ;
    do    
        echo $word >> output.txt
    done 
done < $file
sort output.txt | uniq -c | sort -nr | head -n 5



#cat "$file" \ | tr -c '[:alnum:]' '[\n*]'  | tr '[:upper:]' '[:lower:]'  | grep -v '^$' \ | sort \ | uniq -c \ | sort -nr \  | head -n 5                         