#!/bin/bash

echo "* Generating the website"
make
if [ $? == 0 ] 
then
	echo "* Uploading modification on Github pages"
	ghp-import -m "new revision" -b master output && git push origin master
  echo "* Uploading using ssh to the Raspberry Pi"
  scp -r output/* pi:/srv/http/.
fi
