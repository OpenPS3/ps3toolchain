#!/bin/sh
# check-python.sh adaptado para Python 3

## Check for python3.
( python3 --version || python3 -V ) 1>/dev/null 2>&1 || { echo "ERROR: Install python3 before continuing."; exit 1; }

## Check for python3-config
pyprefix=$(python3-config --prefix)
[ $? -eq 0 ] || { echo "ERROR: Install python3-dev before continuing."; exit 1; }

## Check for python3 header files
( ls -1d "${pyprefix}"/include/python3.*/Python.h || ls -1d /opt/local/include/python3.*/Python.h ) 1>/dev/null 2>&1 || {
    echo "ERROR: Python3 header files not found. Install python3-dev."
    exit 1
}
