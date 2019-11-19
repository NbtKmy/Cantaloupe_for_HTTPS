#!/bin/sh

path="path/to/Cantaloupe-ordner"
path2='dirname $0'

cd $path2 

/usr/bin/certbot-auto renew --standalone --quiet

$path/create_keystore.sh
$path/restart.sh
