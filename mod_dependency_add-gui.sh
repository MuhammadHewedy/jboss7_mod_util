#! /bin/bash

title='Jboss7 mod adding dependency '

mod_name=`zenity --entry --text="Enter module name" --title="$title"`
while [ $? -ne 0 ] || [ ${#mod_name} -lt 2 ]; do
	mod_name=`zenity --entry --text="Enter module name" --title="$title"`
done

dep_mod_name=`zenity --entry --text="Enter dependency module name" --title="$title"`
while [ $? -ne 0 ] || [ ${#dep_mod_name} -lt 2 ]; do
	dep_mod_name=`zenity --entry --text="Enter dependency module name" --title="$title"`
done

mod_name=$(echo $mod_name | sed -e 's/\r//g')
dep_mod_name=$(echo $dep_mod_name | sed -e 's/\r//g')

mod_dependency_add.sh $mod_name $dep_mod_name

exit 0

