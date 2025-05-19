#!/bin/bash

#for checking root access , when its root id -u is 0 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "ERROR:: please run script with root access"
exit 1
else 
echo "you are running with root access"
fi
#check whether package is installed 
dnf list installed mysql 
if [ $? -ne 0 ]
then 
echo "mysql is not installed ..please proceed "
#install the package 

dnf install mysql -y 
 if [ $? -eq 0 ]
 then
echo "mysql is installing ... success"
else 
echo "mysql is failure ..."
exit 1 
fi 

else 
echo "mysql is installed "
fi

