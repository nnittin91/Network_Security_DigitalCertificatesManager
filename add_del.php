<?php
if (PHP_SAPI == 'cli') 
{
$arg1 =  $argv[1];
$arg2 =  $argv[2];
$arg3 =  $argv[3];
}
else
{
$arg1 = $_GET['arg1']; 
$arg2 = $_GET['arg2']; 
$arg3 = $_GET['arg3']; 
}

#$output = shell_exec("./import-cert.sh dirae.lunarservers.com 2083 2>&1 | tee -a /tmp/mylog 2>/dev/null >/dev/null &")       
#$output=shell_exec("./test.sh");
$output=shell_exec("sudo sh /var/www/html/import-cert.sh $arg1 $arg2 $arg3");
echo "<pre>$output</pre>";
if (is_null($output))
{
echo "<pre>Either the command is incorrect or the site does not request certificate</pre>" ;
}
?>
