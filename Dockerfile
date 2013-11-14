FROM ubuntu:12.04
MAINTAINER Shipyard Project "http://shipyard-project.com"
RUN apt-get -qq update
RUN apt-get install -y wget psmisc
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pg.list
RUN wget --no-check-certificate --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql-9.3 postgresql-contrib-9.3
ADD run.sh /usr/local/bin/run
ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ADD postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
RUN chown -R postgres /etc/postgresql
VOLUME /var/lib/postgresql
EXPOSE 5432
CMD ["/bin/bash", "-e", "/usr/local/bin/run"]
