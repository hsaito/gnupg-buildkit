#!/bin/bash

set -e
set -o pipefail

gpg_verify="gpg -d"

echo "Verifying build_custom_path.sh"
$gpg_verify build_custom_path.sh.sig

if [[ $1 == "" ]] ; then
        echo "Please enter path"
        exit 2
fi

export PATH=$1/bin:$PATH
export LD_LIBRARY_PATH=$1/lib

exec ./build.sh --prefix=$1
