#!/usr/bin/perl

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
