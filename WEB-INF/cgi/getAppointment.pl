use DBI;
use strict ;
use CGI;
use JSON;

my $driver = "mysql";
my $cgi = CGI->new();

my $appointment = $cgi->param('appointment');
my $schedule_time = $cgi->param('schedule_time');


my $database= "schedule_db";
my $dsn = "DBI:$driver:database=$database";

my $userid = "root";
my $password = "toor";

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;


my $sth = $dbh->prepare("SELECT DATE, APPOINTMENT,time
                        FROM SCHEDULE_DB");
$sth->execute() or die $DBI::errstr;


#print "Number of rows found :" + $sth->rows +'\n';


my %response =();

print $cgi->header("application/json");

while (my @row = $sth->fetchrow_array()) {
    my($date,$appointment,$Time) = @row;
    $response{$Time}=$appointment;
}

my $json = encode_json \%response;

print $json;
$sth->finish();
