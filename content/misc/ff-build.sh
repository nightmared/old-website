#!/usr/bin/env bash

DEV_DIR=~/development/firefox
INSTALL_DIR=~/ff
UPDATE=0
BUILD=1
INSTALL=0


should_continue() {
  if [ $? == 0 ]
  then
    touch $INSTALL_DIR/success
  else
    touch $INSTALL_DIR/failure
    >&2 echo "Failed at step $1 !"
    exit
  fi
}

cd $DEV_DIR

rm -f $INSTALL_DIR{success,failure}

while getopts “unih?” OPTION
do
  case $OPTION in
    u)
      UPDATE=1 ;;
    i)
      INSTALL=1 ;;
    n)
      BUILD=0 ;;
    h | ?)
      echo '$0 [-u] [-n] [-i]'
      echo '-u --> update'
      echo '-n --> do not build'
      echo '-i --> install'
      exit ;;
     esac
done


if [ $UPDATE == 1 ]
then
  hg pull -u &> $INSTALL_DIR/update.log
  should_continue "updating"
fi

if [ $BUILD == 1 ]
then
  ./mach build &> $INSTALL_DIR/build.log
  should_continue "building"
fi

if [ $INSTALL == 1 ]
then 
  ./mach install &> $INSTALL_DIR/install.log
  should_continue "installation"
fi
