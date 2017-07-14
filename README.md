# break-web-scanners

Its like GORILLAS.BAS, only different.

This creates a bunch of "vulnerable" files and directories that tools such as
nikto, dirbuster, and others look for creating so many false positives that
it renders the tools mostly useless.

It will not over-write files that already exist, and there is currently no
way to reverse what this does. Therefore, make a backup of your web directory
before running this. It is not my fault if you do something that breaks your
server.

## Example usage:

	# ./break-web-scanners.sh /var/www/htdocs

