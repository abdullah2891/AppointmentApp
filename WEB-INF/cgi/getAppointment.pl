use DBI;
use strict ;
use CGI;

my $driver = "mysql";
my $cgi = CGI->new();

my $appointment = $cgi->param('appointment');
my $schedule_time = $cgi->param('schedule_time');


my $database= "schedule_db";
my $dsn = "DBI:$driver:database=$database";

my $userid = "root";
my $password = "toor";

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;


my $sth = $dbh->prepare("SELECT DATE, APPOINTMENT
                        FROM SCHEDULE_DB");
$sth->execute() or die $DBI::errstr;


print "Number of rows found :" + $sth->rows +'\n';


print $cgi->header();
while (my @row = $sth->fetchrow_array()) {
   print "@row\n";
}
print $schedule_time;


$sth->finish();
