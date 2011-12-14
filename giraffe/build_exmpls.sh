#!/bin/sh

for e in $(ls testfiles/*.grf); do
    name=$(echo $e | grep -oe "^[aA-zZ/]*")
    echo $name
    bin/giraffe.rb $e -o $name
done
