sudo apt-get update
sudo apt-get install curl
sudo apt-get install libnss3-tools
sudo apt-get install php5 apache2 libapache2-mod-php5 php5-mcrypt
#open /etc/apache2/apache2.conf and add 
#ServerName= localhost:80
sudo /etc/init.d/apache2 restart
#add the script in /var/www/html/
#add www-data ALL=(ALL) NOPASSWD:ALL

#add the php script to the /var/www/html folder
