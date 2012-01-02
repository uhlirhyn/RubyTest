#!/bin/bash

xterm -sl 100000000 -bg black -fg yellow -e "bin/pentomino.rb $1 $2 $3 $4 -rdebug; read"
