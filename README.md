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
