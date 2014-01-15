#! /bin/bash

title='Jboss7 mod create'
title2='Choose jar file for module'

mod_name=`zenity --entry --text="Enter name of new module" --title="$title"`
while [ $? -ne 0 ] || [ ${#mod_name} -lt 2 ]; do
	mod_name=`zenity --entry --text="Enter name of new module" --title="$title"`
done

mod_jar=`zenity --file-selection --file-filter="*.jar" --title="$title2"`
while [ $? -ne 0 ]; do
	mod_jar=`zenity --file-selection --file-filter="*.jar" --title="$title2"`
done

mod_name=$(echo $mod_name | sed -e 's/\r//g')
mod_jar=$(echo $mod_jar | sed -e 's/\r//g')
mod_jar=`cygpath "$mod_jar"`

mod_create.sh $mod_name $mod_jar

exit 0
