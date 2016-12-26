#!/bin/sh
set -e

echo "HELLO WORLD!"

SERVICES="open-budget-data-api budgetkey-app-search open-budget-search-api"


for x in $SERVICES
do
  while ! ping -c1 $x &>/dev/null; do :; done && echo "$x is UP"
done

echo "NGINX STARTING"
nginx -g "daemon off;"
