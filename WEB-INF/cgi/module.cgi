use strict;
use warnings;

use CGI;

my $CGI = new CGI();

sub main{

  print $CGI-> header();
  print<<HTML;
    <html>
    <body></body>
    <html>
  HTML

main();
