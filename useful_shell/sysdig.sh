#!/bin/bash

logfile=/var/log/sysdig_users.log
touch $logfile
sysdig -c spy_users >>$logfile


