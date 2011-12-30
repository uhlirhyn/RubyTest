#!/bin/sh

for e in $(ls testfiles/*.grf); do
    name=$(echo $e | grep -oe "^[aA-zZ/]*")
    cmd="bin/giraffe.rb $e -o $name"
    echo $cmd
    $cmd
done
