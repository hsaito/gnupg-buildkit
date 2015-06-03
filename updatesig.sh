#!/bin/bash
set -e
set -o pipefail

GPGOPT='--keyserver hkp://keys.gnupg.net --import-options import-clean'

gpg $GPGOPT --recv-key 249B39D24F25E3B6
gpg $GPGOPT --recv-key 04376F3EE0856959
gpg $GPGOPT --recv-key 2071B08A33BD3F06
gpg $GPGOPT --recv-key 1FDFD937AFF2E40B

