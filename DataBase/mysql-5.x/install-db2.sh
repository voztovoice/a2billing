#!/bin/bash
SCRIPT_DIR=$(dirname $0)
sqllist=(
    a2billing.sql
)

echo ""
echo "Install A2Billing Database"
echo "--------------------------"
echo ""

echo "Enter Database Name : "
read dbname

echo "Enter Hostname : "
read hostname

echo "Enter UserName : "
read username

echo "Enter Password : "
read password

echo mysql --user=$username --password=$password --host=$hostname $dbname

for script in "${sqllist[@]}"
do
	cat $SCRIPT_DIR/$script|mysql --user=$username --password=$password --host=$hostname $dbname
done

# All done, exit ok
exit 0
