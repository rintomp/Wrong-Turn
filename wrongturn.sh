#!/bin/bash

# Generate ASCII art text
toilet -f bigmono9 -F gay WR0NG TURN

# Print the warning message
echo -e "☠️..☠️..☠️..☠️...\e[31mW\e[0mR0NG \e[31mT\e[0mURN...☠️..☠️..☠️..☠️"
echo -e "\n\nA simple straightforward tool; enter the target URL (example, testphp.vulnweb.com).\n"
echo " Enter URL : "

# Read the URL from user input
read url

# Fetch URLs from the Wayback Machine, filter, replace and check
waybackurls $url | grep -a -i \=http | qsreplace 'http://evil.com' | while read host; do
    curl -s -L $host -I | grep "evil.com" && echo -e "$host \e[41mWr0ng Turn\e[0m☠️"
done

# Final message
echo -e "\n\e[34mCopy and test Wr0ng Turn results on browser to avoid false positives\e[0m"
