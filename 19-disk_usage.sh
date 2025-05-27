#/!bin/bash 
 #-v is used to remove filesystem line 
Disk_usage=$(df -hT | grep -v Filesystem)
Disk_thresold=5

while IFS= read line 
do
    USAGE=$( echo $line | awk '{print $6F}'| cut -d "%" -f1 )
    PARTITION=$(echo $line | awk '{print $7F}')
    if [$USAGE -ge $Disk_thresold];
    then 
        msg+="High disk usage on $PARTITION: $USAGE % <br>"
    fi

done <<< $Disk_usage 
