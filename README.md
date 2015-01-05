gnupg-buildkit
==============

Build Kit for GNU Privacy Guard

Script for building GnuPG on Linux from the official source.

Contents
--------

- get.sh -- Download the file
- build.sh -- Normal build script. Arguments passed to configure
- build_custom_path.sh -- Wrapper script to build GnuPG to custom prefix
- packages.list -- Contains the location of the package to download

Requirements
------------
Currently, these scripts are mainly useful for upgrading GnuPG, because package verifications require existing GnuPG installed.

- GnuPG 1.4 or later
- wget
- bash