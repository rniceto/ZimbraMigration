#!/bin/bash
# Cria as contas no Zimbra
ZMPROV="/opt/zimbra/bin/zmprov"
for DADOS in $(ls contas); do

   EMAIL=$(grep Conta contas/$DADOS | awk -F " " '{print $2}')
   DNAME=$(grep Display contas/$DADOS | awk -F " " '{print $2" "$3" "$4" "$5}')
   PNAME=$(grep Nome contas/$DADOS | awk -F " " '{print $2}')
   SNAME=$(grep Sobrenome contas/$DADOS | awk -F " " '{print $2}')
   SENHA=$(grep Senha contas/$DADOS | awk -F " " '{print $2}')



$ZMPROV ca "$EMAIL" "$SENHA" displayName "$DNAME" givenName "$PNAME" sn "$SNAME" zimbraCOSid "e00428a1-0c00-11d9-836a-000d93afea2a"

done

