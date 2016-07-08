use DBI;
use strict ;
use DateTime ;
use CGI;
use HTML::Template;



my $driver = "mysql";
my $cgi = CGI->new();

my $appointment = $cgi->param('appointment');
my $schedule_time = $cgi->param('schedule_time');


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
                       (DATE, APPOINTMENT,time )
                        values
                       ('$date $time', '$appointment','$schedule_time')");
$sth->execute() or die $DBI::errstr;

my $CGI = new CGI();
my $templ = HTML::Template -> new (filename=>'home.tmpl');


print $CGI->header();
print $templ->output();


$sth->finish();
