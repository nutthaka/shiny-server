#!/bin/sh

# Add CRAN repository mirror
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
echo "deb https://cran.rstudio.com/bin/linux/ubuntu xenial/" > /etc/apt/sources.list.d/cran.list
apt-get update

# Install R
apt-get install -y r-base r-base-dev

# Install the latest shiny-server build
VERSION=$(curl -SsL "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION")
curl -SsLO "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-$VERSION-amd64.deb"
apt-get install -y ./shiny-server-$VERSION-amd64.deb

R -e "install.packages('shiny', repos='https://cran.rstudio.com/')"

cp -R /usr/local/lib/R/site-library/shiny/examples/* /srv/shiny-server/
