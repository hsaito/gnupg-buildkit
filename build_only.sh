#!/bin/bash
# (Order) libgpg-error, libksba, libgcrypt, libassuan, npth, gnupg

set -e
set -o pipefail

tar_cmd="tar xvjf"
gpg_verify="gpg --homedir $PWD/.gnupg -d"

if [ ! -f ./no_verify ]; then
	echo "Verifying" $0
	$gpg_verify $0.sig

	echo "Verifying package list"
	$gpg_verify packages.list.sig
fi

source packages.list

cd files

for ((i=0;i<${#package_list[@]};++i)); do
	if [ ! -f ../no_verify ]; then
		$gpg_verify ${package_list[i]}-${package_version[i]}.tar.bz2.sig
	fi
	$tar_cmd ${package_list[i]}-${package_version[i]}.tar.bz2
	cd ${package_list[i]}-${package_version[i]}
	./configure $*
	make
	cd ..
done

echo "Build complete (nothing else have been done)"
cd ..
