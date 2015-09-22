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

Requirements
------------
Currently, these scripts are mainly useful for upgrading GnuPG, because package verifications require existing GnuPG installed.

- GnuPG 1.4 or later
- curl
- bash

License
-------
The MIT License (MIT)

Copyright (c) 2015 Hideki Saito

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
