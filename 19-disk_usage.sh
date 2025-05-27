#/!bin/bash 
 #-v is used to remove filesystem line 
Disk_usage=$(df -hT | grep -v Filesystem)
Disk_threhold=5
msg=""

while IFS= read line 
do
    USAGE=$(echo $line | awk '{print $6F}'| cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7F}')
    #if [ $USAGE -ge $Disk_threhold ]
    if [ $USAGE -ge $Disk_threhold ]

    then 
        echo="High disk usage on $PARTITION:$USAGE % <br>"
    fi

done <<< $Disk_usage 
