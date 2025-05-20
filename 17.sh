#!/bin/bash

PACKAGES=("mysql" "python" "nginx" "httpd")
for package in $@
do
    dnf list installed $package 
    if [ $? -ne 0 ]
    then
        echo "$package is not installed... going to install it" | tee 
        dnf install $package -y &>>$LOG_FILE
        
    else        echo -e "Nothing to do $package... $Y already installed $N" | tee 
    fi
done