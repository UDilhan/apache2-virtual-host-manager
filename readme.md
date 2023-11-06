# Virtual Host Creation Script

This script simplifies the process of creating and configuring a virtual host in Apache for both HTTP and HTTPS. It streamlines the following tasks:

1. **Creating the HTTP Virtual Host Configuration**: It creates an Apache configuration file for the specified virtual host, enabling HTTP access.

2. **Enabling the HTTP Virtual Host**: The script uses the `a2ensite` command to enable the newly created HTTP virtual host.

3. **Reloading Apache**: After enabling the virtual host, it reloads the Apache service to apply the changes.

4. **Obtaining SSL Certificate**: The script uses Certbot to request an SSL certificate for the specified host, enabling HTTPS access.

5. **Creating the HTTPS Virtual Host Configuration**: It creates an Apache configuration file for the SSL-enabled virtual host.

6. **Enabling the HTTPS Virtual Host**: The script uses the `a2ensite` command to enable the HTTPS virtual host.

7. **Reloading Apache Again**: After enabling the SSL virtual host, it reloads the Apache service once more to apply the changes.

8. **Setting Appropriate Permissions**: It ensures that the web server user (usually `www-data`) has the necessary permissions to access the website's files.

9. **Change to Document Root Directory**: The script changes the current directory to the document root of the newly created virtual host.

## How to Use

1. Execute the script in a terminal.

2. When prompted, enter the desired virtual host name (e.g., example.com).

3. The script will proceed to create the virtual host configuration files and SSL certificate for your site.

4. Once the process is complete, the script will change the current directory to the document root of the new virtual host.

Please ensure that you have Apache and Certbot installed on your system before using this script. Additionally, make sure to run the script with appropriate permissions, as some actions may require superuser privileges.

## Important Note

This script assumes a basic virtual host configuration. You may need to modify the generated configuration files to match the specific requirements of your website.

Use this script at your own discretion and consider additional security measures as necessary for your web server environment.
