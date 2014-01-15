#! /bin/bash
if [ $# -lt 2 ]
  then
	echo "Usage $(basename "$0") <module name> <module jar>"
	echo -e "\n(You might need to backup your files before use)"
	exit 1
fi

if [ ! -d 'modules' ]; then
    echo "Invalid jboss7 dir, should run from inside jboss7 dir."
	exit 2
fi

if [ ! -f "$2" ]; then
    echo "File not found ($2)."
	exit 3
fi

mod_name=$1
mod_jar=$2
mod_path=modules/${mod_name//.//}/main

echo "creating module \""$mod_name"\"..."
mkdir -p $mod_path
cp "$mod_jar" $mod_path

module_xml=$( cat <<EOF
<?xml version="1.0" encoding="UTF-8"?>
\n
\n<!--
\n  ~ JBoss, Home of Professional Open Source.
\n  ~ Copyright 2011, Red Hat, Inc., and individual contributors
\n  ~ as indicated by the @author tags. See the copyright.txt file in the
\n  ~ distribution for a full listing of individual contributors.
\n  ~
\n  ~ This is free software; you can redistribute it and/or modify it
\n  ~ under the terms of the GNU Lesser General Public License as
\n  ~ published by the Free Software Foundation; either version 2.1 of
\n  ~ the License, or (at your option) any later version.
\n  ~
\n  ~ This software is distributed in the hope that it will be useful,
\n  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
\n  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
\n  ~ Lesser General Public License for more details.
\n  ~
\n  ~ You should have received a copy of the GNU Lesser General Public
\n  ~ License along with this software; if not, write to the Free
\n  ~ Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
\n  ~ 02110-1301 USA, or see the FSF site: http://www.fsf.org.
\n  -->
\n  <!-- module created by mod_create.sh - by mhewedy (https://github.com/MuhammadHewedy) -->
\n<module xmlns="urn:jboss:module:1.1" name="$mod_name">
\n    <properties>
\n        <property name="jboss.api" value="private"/>
\n    </properties>
\n
\n    <resources>
\n        <resource-root path="$(basename "$mod_jar")"/>
\n        <!-- Insert resources here -->
\n    </resources>
\n
\n    <dependencies>
\n    </dependencies>
\n</module>
EOF
)

echo -e $module_xml > $mod_path/module.xml

echo "done."
