#!/usr/bin/perl
##########################################################################
#
# Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
#
# This software is licensed as described in the file LICENSE, which
# you should have received as part of this distribution.
#
# You may opt to use, copy, modify, merge, publish, distribute and/or sell
# copies of the Software, and permit persons to whom the Software is
# furnished to do so, under the terms of the COPYING file.
#
# This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
# KIND, either express or implied.
#
# SPDX-License-Identifier: curl
#
##########################################################################

my @files=('CHANGES', 'roffit', 'roffit.1', 'LICENSE', 'Makefile', 'README');

my $version=$ARGV[0];

if(!$version) {
    print "Usage: release.pl <version>\n";
    exit;
}

my $dir = "roffit-$version";

mkdir $dir;

for(@files) {
    `cp $_ $dir`;
}

`tar czf roffit-${version}.tar.gz $dir`;

`rm -rf $dir`;
