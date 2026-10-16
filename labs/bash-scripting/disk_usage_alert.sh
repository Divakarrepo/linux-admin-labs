echo "========================== Disk Usage Alert ============================"

threshold=80
Date=$(date '+%y-%m-%d %H:%M:%S')
usage=$(df -h / | awk 'NR>1 {print $5}' | sed 's/%//')

if [ $usage -ge $threshold ];
then
        echo -e "Hostname: $(hostname)\nTime: $Date"
        echo -e "Message: Disk usage alert usage morethen threshold limit"
        echo -e "Current disk usage: $usage%\nThreshold limit: $threshold%"
        printf 'To: divakar00232@gmail.com\nSubject: Disk usage alert\n\nHostname: %s\nTime: %s\nUsage: %s%%\n' \ "$(hostname)" "$Date" "$usage" | msmtp divakar00232@gmail.com
else
        echo -e "Hostname: $(hostname)\nTime: $Date"
        echo -e "Message: Disk usage lessthen threshold limit"
        echo -e "Current disk usage: $usage%\nThreshold limit: $threshold%"
fi

echo "========================================================================="
