#!/bin/bash
# by Jeferson


ZMPROV="/opt/zimbra/bin/zmprov"
for MAIL in $($ZMPROV -l gaa | sort);   do
                DNOME=$($ZMPROV -l ga $MAIL displayName | grep displayName | awk -F " " '{print $2" "$3" "$4" "$5}')
                PNOME=$($ZMPROV -l ga $MAIL givenName | grep givenName | awk -F " " '{print $2}')
                SNOME=$($ZMPROV -l ga $MAIL sn | grep sn | awk -F " " '{print $2}')
                SENHA=$($ZMPROV -l ga $MAIL userPassword | grep userPassword | awk -F " " '{print $2}')

                echo "Conta: $MAIL" >> contas/dados-$MAIL
                echo "Display: $DNOME" >> contas/dados-$MAIL
                echo "Nome: $PNOME" >> contas/dados-$MAIL
                echo "Sobrenome: $SNOME" >> contas/dados-$MAIL
                echo "Senha: $SENHA" >> contas/dados-$MAIL
done

