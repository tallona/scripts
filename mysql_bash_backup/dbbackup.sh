
#!/bin/bash

# Database credentials
db_name="database_name"

# Other options
backup_path="/path/to/directory/"
config_path="/path/to/configuration.cnf"
date=$(date +"%d-%b-%Y")

# Set default file permissions
umask 177

# Dump database into SQL file
mysqldump --defaults-extra-file=$config_path $db_name > $backup_path/$db_name-$date.sql

# Delete files older than 10 days
find $backup_path/* -mtime +10 -exec rm {} \;