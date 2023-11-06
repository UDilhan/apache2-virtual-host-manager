#!/bin/bash
read -p 'Virtual host: ' host
mkdir -p /var/www/html/$host
echo "Creating HTTP virtual host"
cat <<EOF > /etc/apache2/sites-available/$host.conf
<VirtualHost $host:80>
        ServerName $host

        ServerAdmin tech@systemstatus.fr
        DocumentRoot /var/www/html/$host

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        RewriteEngine on
        RewriteCond %{SERVER_NAME} =$host
        RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
</VirtualHost>
EOF
a2ensite $host.conf
systemctl reload apache2
certbot certonly --apache -d $host

echo "Creating HTTPS virtual host"
cat <<EOF > /etc/apache2/sites-available/$host-le-ssl.conf
<IfModule mod_ssl.c>
  <VirtualHost $host:443>
          ServerName $host

          ServerAdmin tech@systemstatus.fr
          DocumentRoot /var/www/html/redirects/$host

          ErrorLog ${APACHE_LOG_DIR}/error.log
          CustomLog ${APACHE_LOG_DIR}/access.log combined

  SSLCertificateFile /etc/letsencrypt/live/$host/fullchain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/$host/privkey.pem
  Include /etc/letsencrypt/options-ssl-apache.conf
  </VirtualHost>
</IfModule>
EOF
a2ensite $host-le-ssl.conf
systemctl reload apache2
chown -R www-data:www-data /var/www/html/$host
echo "Site created"
cd /var/www/html/$host
