#!/bin/bash
set -e
set -o pipefail

gpg_verify="gpg --homedir $PWD/.gnupg -d"

for f in *.sh
	do echo "Verifying $f..."
	$gpg_verify $f.sig
done
