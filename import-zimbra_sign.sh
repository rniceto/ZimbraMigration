#!/bin/bash

ZMPROV="/opt/zimbra/bin/zmprov"
for CONTAS  in $(ls sign) ; do
	MAIL=$(echo $CONTAS | awk -F "assinatura-" '{print $2}')
	ASSINATURA="$(cat sign/$CONTAS  | grep -v ^# | grep -v zimbraSignatureId | grep -v zimbraSignatureName | sed s/zimbraPrefMailSignatureHTML:/""/)"
	/opt/zimbra/bin/zmprov csig $MAIL nova zimbraPrefMailSignatureHTML "$ASSINATURA"

done
