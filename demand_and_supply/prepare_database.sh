#!/usr/bin/env bash
read -p "Database: " db
read -p "Host: " host

echo "DROP DATABASE IF EXISTS $db;" | mysql -h $host -u root -p
echo "CREATE DATABASE IF NOT EXISTS $db;" | mysql -h $host -u root -p
cat prepare_tables.sql | mysql -h $host -u root -p $db
cat set_triggers.sql | mysql -h $host -u root -p $db
cat set_procedures.sql | mysql -h $host -u root -p $db