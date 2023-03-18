#!/usr/bin/env bash
read -p "Path: " path
read -p "File: " file
read -p "Database: " db
read -p "Table: " table
read -p "Host: " host

echo "DROP DATABASE IF EXISTS $db;" | mysql -h $host -u root -p
echo "CREATE DATABASE IF NOT EXISTS $db;" | mysql -h $host -u root -p
cat prepare_tables.sql | mysql -h $host -u root -p $db
