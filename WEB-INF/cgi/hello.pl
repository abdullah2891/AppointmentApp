#!/usr/bin/perl
use CGI;

my $cgi = CGI->new();

my $name = $cgi->param('name');

print $cgi->header();
print "Hello $name";
