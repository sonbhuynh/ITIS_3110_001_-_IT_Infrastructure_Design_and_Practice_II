#!/bin/sh
# this script will add the permissions for a file
# The first parameter is for who: u, g, o, or a
# The second command is for the permission: r, w, or x
# The third parameter is the file name

valid=1
invalid=1

if test $# -ne 3
then
	valid=0
	echo Need 3 parameters!
fi

if test $# -eq 3
then

	case "$1" in
		[!u,!g,!o,!a] )invalid=0; echo "Incorrect parameter for who, accepted [u,g,o,a]";;
	esac

	case "$2" in
		[!r,!w,!x] )invalid=0; echo "Incorrect parameter for the permission,accepted [r,w,x]";;
	esac

	case "$3" in
		*[!a-zA-Z]*|"" )invalid=0; echo "Filename must contain only alphabetic characters!";;
	esac
       
fi


if [ $valid -eq $invalid ];then
	command="chmod $1+$2 $3"
	echo Adding permissions with the following command: $command
	$command
fi