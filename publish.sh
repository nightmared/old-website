#!/bin/sh

make clean && make && ghp-import -m "new revision" -b master output && git push origin master
scp -r output/* pi:/srv/http/.
