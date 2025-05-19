#!/bin/bash

#if condition to check number is greater than  10 or not , pass number dynamically 
# $1 is given to enter the value dynamically , number value will be stored in $1
num=$1 
 if [ $num -gt 10 ]
 then 

 echo "num $num is greater than 10"
 else 
 echo "num $num is less than 10"
 
 fi 
