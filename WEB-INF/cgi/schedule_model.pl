use DBI;
use strict ;
use DateTime ;
use CGI;



my $driver = "mysql";
my $cgi = CGI->new();

my $appointment = $cgi->param('appointment');



my $database= "schedule_db";
my $dsn = "DBI:$driver:database=$database";

my $dt = DateTime->now;
print $dt;
my $date = $dt->ymd;
my $time = $dt->hms;
my $userid = "root";
my $password = "toor";

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;

my $sth = $dbh->prepare("INSERT INTO SCHEDULE_DB
                       (DATE, APPOINTMENT )
                        values
                       ('$date $time', '$appointment')");
$sth->execute() or die $DBI::errstr;
$sth->finish();


my $sth = $dbh->prepare("SELECT DATE, APPOINTMENT
                        FROM SCHEDULE_DB");
$sth->execute() or die $DBI::errstr;


print "Number of rows found :" + $sth->rows +'\n';


print $cgi->header();
while (my @row = $sth->fetchrow_array()) {
   print "@row\n";
}

$sth->finish();
