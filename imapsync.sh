#!/bin/bash

logfile="/var/log/imapsync.log"

###################################################
##### defina o servidor de origem e destino   #####
###################################################

origem="192.168.1.1"
destino="192.168.1.2"

########################################################################
##### Defina as credenciais de admin para se autenticar no Sync    #####
########################################################################


contaAdmin="admin@xpto.com.br"
SenhaAdmin="xpto@123"


###################################################################################################################
#####  Crie um arquivo em /opt/ chamado accounts_list.txt e coloque uma conta por linha que voce deseja migrar   ##
#####  exemplo@xpto.com.br;                																		 ##
#####  exemplo1@xpto.com.br; 																					 ##
#####  exemplo2@xpto.com.br; 																					 ##
###################################################################################################################

echo "-----------------------" >> $logfile
echo "Imapsync iniciado.." >> $logfile


touch $logfile

for line in $(cat /opt/accounts_list.txt) ; do

usuario=$(echo $line | cut -d";" -f1)

imapsync --buffersize 8192000 --nosyncacls --subscribe --syncinternaldates --host1 $origem --ssl1 --user1 $usuario --authuser1 $contaAdmin --password1 $SenhaAdmin --host2 $destino --ssl2 --user2 $usuario --authuser2 $contaAdmin --password2 $SenhaAdmin --noauthmd5 --nofoldersizes --skipsize –-fast

done

