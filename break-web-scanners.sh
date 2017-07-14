#!/bin/bash

# It is like gorillas.bas, but different.
# - Daniel Roberson @dmfroberson July 2017

echo "[+] break-web-scanners.sh -- by Daniel Roberson @dmfroberson"

if [ ! "$1" ]; then
    echo "  usage: break-web-scanners.sh <directory>"
    echo "    directory -- path to wwwroot/htdocs folder"
    echo
    echo "This script will add a bunch of bogus files/directories to fool"
    echo "automated web vulnerability scanners such as dirbuster or nikto"

    exit 1
fi

# Make sure directory exists
if [ ! -d "$1" ]; then
    echo "[-] $1 is not a directory!"
    echo "[-] Exiting."
    exit 1
fi

# Make sure directory is writable
if [ ! -w "$1" ]; then
    echo "[-] $1 is not writable!"
    echo "[-] Exiting."
    exit 1
fi

# Create the bogus directories
for directory in $(cat directories); do
    if [ ! -d "$1/${directory}" ]; then
	echo "[+] Creating directory $1/${directory}"
	mkdir -p "$1/${directory}"
    fi
done

# Create bogus files with random lengths, filled with nonsense so zero
# length replies can't be filtered out.
for fakefile in $(cat files); do
    if [ ! -e "$1/${fakefile}" ]; then
	echo "[+] Creating file $1/${fakefile}"

	cat /dev/urandom | tr -dc " !@#$%^&*<>()-_=+[]{}A-Za-z0-9\n\r\t" \
	    | head -c $(($RANDOM % 4096)) > "$1/${fakefile}"
    fi
done

echo
echo "[+] From downtown!"
echo "[+] Done."
