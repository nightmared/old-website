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
    >&2 echo "Failed at step \"$1\" !"
    exit
  fi
}

cd $DEV_DIR

rm -f $INSTALL_DIR/{success,failure,build.log,update.log,install.log}

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

# usage: exec_step BOOL NAME COMMAND
exec_step() {
  if [ "$1" == "1" ]
  then
    eval "$3 &> $INSTALL_DIR/$2.log"
    should_continue "$2"
  fi
}

exec_step "$UPDATE" "update" "hg pull -u"
exec_step "$BUILD" "build" "./mach build"
exec_step "$INSTALL" "install"  "./mach install"
