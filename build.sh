#!/bin/bash
# (Order) libgpg-error, libksba, libgcrypt, libassuan, npth, gnupg

set -e
set -o pipefail

tar_cmd="tar xvjf"
gpg_verify="gpg --homedir $PWD/.gnupg -d"

echo "Verifying" $0
$gpg_verify $0.sig


echo "Verifying package list"
$gpg_verify packages.list.sig
source packages.list

cd files

for ((i=0;i<${#package_list[@]};++i)); do
	$gpg_verify ${package_list[i]}-${package_version[i]}.tar.bz2.sig
	$tar_cmd ${package_list[i]}-${package_version[i]}.tar.bz2
	cd ${package_list[i]}-${package_version[i]}
	./configure $*
	make
	make install
	cd ..
	rm -r ${package_list[i]}-${package_version[i]}
done

echo "Build complete."
cd ..
