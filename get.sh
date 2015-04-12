#!/bin/bash
set -e
set -o pipefail

gpg_verify="gpg -d"
downloader="curl -# -O"

echo "Verifying" $0
$gpg_verify $0.sig

echo "Verifying package list"
$gpg_verify packages.list.sig
source packages.list

cd files

touch a.tar.bz2
touch a.tar.bz2.sig

rm *.tar.bz2
rm *.tar.bz2.sig

for ((i=0;i<${#package_list[@]};++i)); do
	echo "Downloading" ${package_list[i]}
        $downloader ftp://ftp.gnupg.org/gcrypt/${package_list[i]}/${package_list[i]}-${package_version[i]}.tar.bz2 
	$downloader ftp://ftp.gnupg.org/gcrypt/${package_list[i]}/${package_list[i]}-${package_version[i]}.tar.bz2.sig
        $gpg_verify ${package_list[i]}-${package_version[i]}.tar.bz2.sig
done

$downloader ftp://ftp.gnupg.org/gcrypt/pinentry/$package_pinentry.tar.bz2
$downloader ftp://ftp.gnupg.org/gcrypt/pinentry/$package_pinentry.tar.bz2.sig
$gpg_verify $package_pinentry.tar.bz2.sig
cd ..
