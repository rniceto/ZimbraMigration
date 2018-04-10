#!/bin/bash
for line in $(cat /root/backup-list) ; do

user=$(echo $line |cut -d"@" -f1)
domain=$(echo $line |cut -d"@" -f2 |cut -d"." -f1)
backup=$(echo $line)

echo "iniciando o backup $user"
/opt/zimbra/bin/zmmailbox -z -m $user@$domain.com.br postRestURL "//?fmt=tgz&resolve=reset" /opt/backup/$backup
echo "Finalizado o backup $user"
done
