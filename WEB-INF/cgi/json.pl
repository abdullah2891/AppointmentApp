#!/usr/bin/perl
use JSON;
use CGI;
my $cgi = CGI->new();


my %rec_hash = ('a' => 1, 'b' => 2,'c' => 3, 'd' => 4, 'e' => 5);
my $json = encode_json \%rec_hash;

@array = (%rec_hash,%rec_hash);

print $cgi->header("application/json");

print "@array\n";
