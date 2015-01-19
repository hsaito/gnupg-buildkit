#!/bin/bash
# (Order) libgpg-error, libksba, libgcrypt, libassuan, npth, gnupg

set -e
set -o pipefail

source packages.list

cd files

gpg --keyserver hkp://keys.gnupg.net --recv-key 249B39D24F25E3B6
gpg --keyserver hkp://keys.gnupg.net --recv-key 04376F3EE0856959
gpg --keyserver hkp://keys.gnupg.net --recv-key 2071B08A33BD3F06

tar_cmd="tar xvjf"
gpg_verify="gpg -d"

for package in "${package_list[@]}"
do
	$gpg_verify ${package_list[i]}-${package_version[i]}.tar.bz2.sig
	$tar_cmd ${package_list[i]}-${package_version[i]}.tar.bz2
	cd ${package_list[i]}-${package_version[i]}
	./configure $*
	make
	make install
	cd ..
	rm -r ${package_list[i]}-${package_version[i]}
done


# Pinentry package seems to require some patching
# (At least on Ubuntu...)
$gpg_verify $package_pinentry.tar.bz2.sig
$tar_cmd $package_pinentry.tar.bz2
cd $package_pinentry
./configure $*
cd qt4
sed -i 's,../../../s/pinentry/qt4/,,g;' *.moc
cd ..
make
make install
cd ..
rm -r $package_pinentry

echo "Build complete."
cd ..
