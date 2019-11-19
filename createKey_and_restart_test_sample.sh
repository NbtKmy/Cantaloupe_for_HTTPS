#!/bin/sh

path="/path/to/Cantaloupe-ordner"
path2='dirname $0'

cd $path2 

/usr/bin/certbot-auto renew --force-renewal --standalone

$path/create_keystore.sh
$path/restart.sh
