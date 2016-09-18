#!/bin/bash
# Son Huynh
echo "Host:"
read hostn
echo "User ID:"
read uid
echo "File name:"
read filen
command="scp $uid@$hostn:$filen $filen"
echo "executing $command:"
$command
