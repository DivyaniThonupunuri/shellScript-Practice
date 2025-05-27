#!/bin/bash 

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
Source_directory="/home/ec2-user/applogs"

mkdir $LOGS_FOLDER
echo "Script started executing at $(date)" | tee -a $LOG_FILE


if [ $userid -ne 0 ]
then 
    echo -e " $R ERROR: Run the script with root access $N "| tee -a $LOG_FILE
    exit 1 ; 
else 
    echo -e "$G you are running with root " | tee -a $LOG_FILE
fi

files_to_delete=$(find $Source_directory -name "*.log" -mtime +14)

while IFS= read -r filepath
do 
    rm -rf $filepath
    echo "$R files deleted are ...$filepath $N"
done <<< $files_to_delete
