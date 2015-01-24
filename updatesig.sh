#!/bin/bash
set -e
set -o pipefail

gpg --keyserver hkp://keys.gnupg.net --recv-key 249B39D24F25E3B6
gpg --keyserver hkp://keys.gnupg.net --recv-key 04376F3EE0856959
gpg --keyserver hkp://keys.gnupg.net --recv-key 2071B08A33BD3F06
gpg --keyserver hkp://keys.gnupg.net --recv-key 1FDFD937AFF2E40B

