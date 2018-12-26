#!/bin/sh

if [ "$1" = "-d" ];
then
HOST=$2 ;
# -D for delete -n for name -d directory path
certutil -D -n $HOST -d sql:/home/nittin/.pki/nssdb ;
echo "done";
exit  0;
elif [ "$1" = "-l" ];
then
# -L list -d directory path
sudo certutil -L -d sql:/home/nittin/.pki/nssdb> log;
echo "done";# to take care of return value in php script
exit 0;

elif [ "$1" = "-a" ];
then
HOST=$2
PORTNO=${3:-443}
exec 6>&1
exec > $HOST
# connect to host using ssl then get the string between BEGIN CERTIFICATE and END CERTIFICATE
echo | openssl s_client -connect ${HOST}:${PORTNO} 2>&1 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'
# -A add -t trust level T for trusted C Trusted CA -i for specific certi -f fopr password for opening key database
certutil -d sql:/home/nittin/.pki/nssdb -A -t TC -n "cert_$HOST" -i $HOST -f pswd.txt
exec 1>&6 6>&-
echo "done";
exit 0;
else
exit 1;
fi
