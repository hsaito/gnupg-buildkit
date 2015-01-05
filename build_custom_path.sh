#!/bin/bash

if [[ $1 == "" ]] ; then
        echo "Please enter path"
        exit 2
fi


export PATH=$1/bin:$PATH
export LD_LIBRARY_PATH=$1/lib

exec ./build.sh --prefix=$1
