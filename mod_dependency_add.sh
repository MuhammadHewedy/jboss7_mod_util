#! /bin/bash

if [ $# -lt 2 ]
  then
	echo "Usage $(basename "$0") <module name> <dependency module name>"
	echo -e "\n(You might need to backup your files before use)"
	exit 1
fi

if [ ! -d 'modules' ]; then
    echo "Invalid jboss7 dir, should run from inside jboss7 dir."
	exit 2
fi

if [ ! -f "modules/${2//.//}/main/module.xml" ]; then
    echo "dependency module ($2) not found."
	exit 2
fi

mod_name=$1
dependency_mod_name=$2

module_xml=modules/${mod_name//.//}/main/module.xml
match=""
dep_text="\t<!-- edited by mod_dependency_add.sh -->\n"

if grep -q "<dependencies>" "$module_xml"; then
	match="<\/dependencies>"
	dep_text+="\t<module name="\"$dependency_mod_name\"" \/>"
else
	match="<\/module>"
	dep_text+="\t<dependencies>\n\t\t<module name="\"$dependency_mod_name\"" \/>\n\t<\/dependencies>"
fi

sed -i "s/$match/$dep_text\n$match/g" $module_xml

echo "done"
