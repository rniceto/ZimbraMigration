#!/bin/bash
ZMPROV="/opt/zimbra/bin/zmprov"

for MAIL in $($ZMPROV -l gaa | sort); 	do
		$ZMPROV gsig $MAIL  > sign/assinatura-$MAIL
done
