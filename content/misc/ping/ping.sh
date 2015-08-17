#!/usr/bin/env bash

measure() {
  MEASUREMENT=$(ping -c 1 8.8.8.8 -W 1 | grep received | sed -r 's/^.*([0-1]) received.*$/\1/')
  if [ ${#MEASUREMENT} != 1 ]
  then
    >&2 echo "Huhu, It looks like something goes wrong..."
    exit
  fi

  echo "$(date | cut -d" " -f1-4) - $MEASUREMENT" >> $1
}

while true
do
  measure ping.log
  sleep 30
done
