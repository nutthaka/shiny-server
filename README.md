# shiny-server
Setting up test open-source shiny-server
Server is running on port 3838

* Config file

    /etc/shiny-server/shiny-server.conf

* App location

    /srv/shiny-server/

* Log location

    /var/log/

### References
https://github.com/rstudio/shiny-server/blob/master/vagrant/ubuntu15.04/setup.sh

### Server setup

Route 53  -->

ALB (port 80 mapped to 3838) --> 

Instance

#### Using Nginx as reverse proxy

apt-get install -y nginx

Make a copy of /etc/nginx/sites-available/default e.g. shiny-vhost.conf

Set up Nginx to be reverse proxy in front of Shiny server (shiny-vhost.conf)


    location / {
   
                proxy_pass http://127.0.0.1:3838;
        }

Remove the existing _default_ link in /sites-enabled. Nginx cannot have two server blocks pointing to the same port i.e. 80 in this case

Create a sym-link in /sites-enabled pointing to shiny-vhost.conf

    ln -s /etc/nginx/sites-available/shiny-vhost.conf shiny-vhost.conf
    
Test Nginx config

    nginx -t
    
Restart nginx

    systemctl restart nginx.service
 
