jboss7_mod_util
=========

jboss7_mod_util is a group of utility to help manipulate the booring process of creating and maintaing jboss7 modules.

It is a bash scripts that run under CYGWIN. also you will need to install [zenity for windows]


It consist for now from 2 utils:

  - mod_create.sh
  - mod_dependency_add.sh

Each one comes into 2 flavors, command-line, and GUI (using zenity)

Usage
--------------
You should use these commands from the jboss7 home dir

```sh
mod_create-gui.sh   # to create a module
mod_dependency_add-gui.sh # to modify a module to add dependency
```

You still can use the version without `-gui` if you like, for example you can create a module using:

```sh
mod_create.sh my.module.name /path/to/module/jar/file.jar
```   

##### When invoke the non-`gui` commands without parameters, you can see a usage output:

```sh
$ mod_create.sh
Usage mod_create.sh <module name> <module jar>

(You might need to backup your files before use)

$ mod_dependency_add.sh
Usage mod_dependency_add.sh <module name> <dependency module name>

(You might need to backup your files before use)

```

License
----

Apache 2

[zenity for windows]:http://www.placella.com/software/zenity/
