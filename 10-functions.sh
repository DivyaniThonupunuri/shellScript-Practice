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

VALIDATE(){
    if [ $1 -eq 0 ]
    then
            echo "$2 is installing ... success"
    else 
            echo "$2 is failure ..."
            exit 1 
    fi 
}
dnf list installed mysql 
    if [ $? -ne 0 ]
    then 
        echo "mysql is not installed ..please proceed "
#install the package 

dnf install mysql -y 
    VALIDATE $? "mysql"

    else 
        echo "mysql is installed "
    fi

dnf list installed python3 
    if [ $? -ne 0 ]
    then 
        echo "python3 is not installed ..please proceed "
#install the package 

dnf install python3 -y 
    VALIDATE $? "python3"

    else 
        echo "python3 is installed "
    fi

dnf list installed nginx
    if [ $? -ne 0 ]
    then 
        echo "nginx is not installed ..please proceed "
#install the package 

dnf install nginx -y 
    VALIDATE $? "nginx"

    else 
        echo "nginx is installed "
    fi

