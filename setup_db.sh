#!/bin/bash

# MySQL credentials
MYSQL_USER="root"
DATABASE_NAME="flog_db"

# Prompt for MySQL password
echo "Enter MySQL password for user $MYSQL_USER:"
read -s MYSQL_PASSWORD

# Path to your SQL scripts
SQL_SCRIPT1="populate_blog.sql"
SQL_SCRIPT2="populate_categories.sql"
SQL_SCRIPT3="populate_events.sql"
SQL_SCRIPT4="populate_user.sql"
SQL_SCRIPT5="populate_points_of_interest.sql"
SQL_SCRIPT6="populate_reviews.sql"

# fresh start
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "DROP DATABASE IF EXISTS $DATABASE_NAME;"

# Create the database
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

# Import your SQL scripts
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" $DATABASE_NAME < "$SQL_SCRIPT1"
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" $DATABASE_NAME < "$SQL_SCRIPT2"
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" $DATABASE_NAME < "$SQL_SCRIPT3"
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" $DATABASE_NAME < "$SQL_SCRIPT4"
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" $DATABASE_NAME < "$SQL_SCRIPT5"
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" $DATABASE_NAME < "$SQL_SCRIPT6"

echo "Database setup completed."

