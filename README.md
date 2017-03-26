gnupg-buildkit
==============

Build Kit for GNU Privacy Guard modern (2.1.x)

Script for building GnuPG modern on Linux from the official source.

Contents
--------

- get.sh -- Download the file
- build.sh -- Normal build script. Arguments passed to configure
- build_custom_path.sh -- Wrapper script to build GnuPG to custom prefix
- updatesig.sh -- Script to update package signers' signatures
- packages.list -- Contains the location of the package to download

Note: A digital signature for packages.list expires 6 months after its creation. You may have to generate your own digital signature file (or modify the script to skip the verification) if you need to use the packages that are outdated.

Inhibiting Signature Check (Not Recommended for General Usage)
--------------------------------------------------------------
It is possible to inhibit signature check by an existing copy of GnuPG. This may be useful when you are attempting to compile GnuPG modern on a system without any version of GnuPG installed. Simply create a file called no_verify on the root of the directory. However, you will have to verify integrity of the package in some other way.

Workflow
--------
If you have any proposal to merge, please issue an pull requests to the next branch.

Utilities
---------
There is a utility to generate packages.list, called [GnuPG_Buildkit_Package_Lister](https://github.com/hsaito/GnuPG_Buildkit_Package_Lister), which automates generation of this file.

Requirements
------------
Currently, these scripts are mainly useful for upgrading GnuPG, because package verifications require existing GnuPG installed.

- GnuPG 1.4 or later
- curl
- bash
