#!/bin/bash

find /var/backup/ -iname "*txt" | \
  while read I; do
   cp -vfr "$I" /opt/application/new/ 
  done
for file in $(find /opt/application/new -name '*.txt')
do
  mv $file $(echo "$file" | sed -r 's|.txt|.html|g')
done
for file in $(find /opt/application/new -name '*.html')
do
 sed  -i '1s/^/<html>/'  $file && 
 sed -i '$a</html>' $file &&
 sed -i 's/\echo//' $file &&
 sed -i 's/\old/new/' $file && tar -cf application.tar.gz $(find /opt/application/new -name '*.html'); done
