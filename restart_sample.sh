#!/bin/bash

# für stoppen
path="/path/to/Cantaloupe-Ordner"
targetpath="$path/cantaloupe-4.0.2.war"

cd $path


echo "Stop $targetpath server."

pkill -f cantaloupe

# für starten

echo "restart $targetpath server."

nohup java -Dcantaloupe.config=$path/cantaloupe.properties -Xmx3g -jar $targetpath &


