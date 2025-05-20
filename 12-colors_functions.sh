#!/bin/bash

#for checking root access , when its root id -u is 0 

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]
then 
    echo -e " $R ERROR:: please run script with root access $N "
    exit 1
else 
    echo "you are running with root access"
fi
# enabled function which takes arguments 1, 2 as inputs . validate function takes input as exit status 
VALIDATE(){
    if [ $1 -eq 0 ]
    then
            echo -e "$2$G is installing ... $G success $N"
    else 
            echo  -e "$2$R is $R failure ... $N "
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
        echo -e " $Y mysql is installed ...  $G SUCCESS $N "
    fi
    #python list package
dnf list installed python3 
    if [ $? -ne 0 ]
    then 
        echo -e " $R python3 is not installed ..please proceed  $N "
#install the package 
dnf install python3 -y 
    VALIDATE $? "python3"
    else 
        echo -e " $Y python3 is installed .... $G SUCCESS $N "
    fi

dnf list installed nginx
    if [ $? -ne 0 ]
    then 
        echo "nginx is not installed ..please proceed "
#install the package 
dnf install nginx -y 
    VALIDATE $? "nginx"
    else 
        echo -e " $Y nginx is installed .... $G SUCCESS $N "
    fi

