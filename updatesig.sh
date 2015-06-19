#!/bin/bash
set -e
set -o pipefail

gpg_command="gpg --keyserver hkp://keys.gnupg.net --homedir $PWD/.gnupg"

$gpg_command --recv-key 249B39D24F25E3B6
$gpg_command --recv-key 04376F3EE0856959
$gpg_command --recv-key 2071B08A33BD3F06
$gpg_command --recv-key 1FDFD937AFF2E40B

