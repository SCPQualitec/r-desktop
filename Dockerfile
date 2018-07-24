FROM kxes/desktop:latest
MAINTAINER Alexandre Teles
RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN apt-get update && apt-get install -y mongodb r-base r-base-dev
RUN wget https://download2.rstudio.org/rstudio-server-1.1.456-amd64.deb -O /opt/rstudio-server-1.1.456-amd64.deb
RUN dpkg -i /opt/rstudio-server-1.1.456-amd64.deb
RUN apt-get -f install -y
CMD systemctl enable mongod.service
