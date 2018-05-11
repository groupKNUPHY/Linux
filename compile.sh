#!/bin/bash
if [  -e *.exe ]; then rm *exe; fi
if [  -e $1 ]; then g++ $1 -o $1.exe; fi

