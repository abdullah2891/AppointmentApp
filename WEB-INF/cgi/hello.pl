#!/usr/bin/perl
print ("Content-type: text/html\n\n");
$now = localtime();
print <<"STUFF";
<html>
<head><title>Wow!</title></head>
<body bgcolor=green text=white>
This is going to look naff at $now
</body>
</html>
STUFF
