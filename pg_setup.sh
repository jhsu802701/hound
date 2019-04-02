#!/bin/bash

######################################
# BEGIN: setting environment variables
######################################
PG_VERSION="$(ls /etc/postgresql)"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
#########################################
# FINISHED: setting environment variables
#########################################

##########################################
# BEGIN: updating PostgreSQL configuration
##########################################
echo '-------------------'
echo "Configuring $PG_HBA"

sudo bash -c "echo '# TYPE  DATABASE        USER            ADDRESS                 METHOD' > $PG_HBA"
sudo bash -c "echo '' >> $PG_HBA"
sudo bash -c "echo '# Allow postgres user to connect to database without password' >> $PG_HBA"
sudo bash -c "echo 'local   all             postgres                                trust' >> $PG_HBA"
sudo bash -c "echo '' >> $PG_HBA"
sudo bash -c "echo 'local   all             all                                     trust' >> $PG_HBA"
sudo bash -c "echo '' >> $PG_HBA"
sudo bash -c "echo '# Full access to 0.0.0.0 (localhost) for pgAdmin host machine access' >> $PG_HBA"
sudo bash -c "echo '# IPv4 local connections:' >> $PG_HBA"
sudo bash -c "echo 'host    all             all             0.0.0.0/0               trust' >> $PG_HBA"
sudo bash -c "echo '' >> $PG_HBA"
sudo bash -c "echo '# IPv6 local connections:' >> $PG_HBA"
sudo bash -c "echo 'host    all             all             ::1/128                 trust' >> $PG_HBA"
#############################################
# FINISHED: updating PostgreSQL configuration
#############################################  

sh pg-restart.sh

# Wait for PostgreSQL to fully start up before doing anything else
echo '--------------'
echo 'bundle install'
bundle install

echo '++++++++++++++++++++++++++++++++++++'
echo 'BEGIN: creating PostgreSQL databases'
echo '++++++++++++++++++++++++++++++++++++'

echo '----------------------------------------'
echo "sudo -u postgres createuser -d $USERNAME"
sudo -u postgres createuser -d $USERNAME
 
echo '-----------------------------------'
echo "Make the user $USERNAME a superuser"
psql -c "ALTER USER $USERNAME WITH SUPERUSER;" -U postgres

echo '--------------------------------------------------------'
echo "psql -c 'create database hound_development;' -U postgres"
psql -c 'create database hound_development;' -U postgres

echo '-------------------------------------------------'
echo "psql -c 'create database hound_test;' -U postgres"
psql -c 'create database hound_test;' -U postgres

echo '+++++++++++++++++++++++++++++++++++++++'
echo 'FINISHED: creating PostgreSQL databases'
echo '+++++++++++++++++++++++++++++++++++++++'
