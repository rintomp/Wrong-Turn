#!/usr/bin/bash


toilet -f bigmono9 -F gay WR0NG TURN

echo -e ☠️..☠️..☠️..☠️..."\e[31mW\e[0m"R0NG "\e[31mT\e[0m"URN...☠️..☠️..☠️..☠️"\n\nA simple straightforward tool; enter the target URL (example, testphp.vulnweb.com).\n"
echo "
 Enter URL : "
read url

waybackurls $url | grep -a -i \=http | qsreplace 'http://evil.com' | while read host do;do curl -s -L  $host -I|grep "evil.com" && echo -e "$host \e[41mWr0ng Turn\e[0m☠️" ;done

echo -e "\n\e[34mCopy and test Wr0ng Turn results on browser to avoid false positive
 \e[0m"


