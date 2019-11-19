#!/bin/sh


serverpath="/path/to/Cantaloupe-Ordner"
passA="[Passwort A]"
passB="[Passwort B]"
pempath="/etc/letsencrypt/live/[Domain-Name]"
pkcsname="fullchain_and_key.p12"
keyalias="[Aliasname]"
jksname="MyKeyStore.jks"

cd $pempath

if [ -f $pkcsname ]; then
    rm $pkcsname
fi

if [ -f $jksname ]; then
    rm $jksname
fi

openssl pkcs12 -export -passout pass:$passA -in $pempath/fullchain.pem -inkey $pempath/privkey.pem -out $pkcsname -name $keyalias

keytool -importkeystore -deststorepass $passA -destkeypass $passB -destkeystore $jksname -srckeystore $pkcsname -srcstoretype PKCS12 -srcstorepass $passA -alias $keyalias

chmod 660 $pkcsname
chmod 660 $jksname

#Falls man jks-keystore-File in den Cantaloupe-Ordner bewegen möchte, soll man das #-Zeichen der nächsten Zeile löschen. 
#mv -f $jksname $serverpath


