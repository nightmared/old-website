#!/usr/bin/env bash

should_continue() {
  if [ $? != 0 ]
  then
    >&2 printf "Failed at step %s !"\\n $1
    exit 1
  fi
}

# usage: exec_step EXECUTE? STEP_NAME COMMAND
exec_step() {
  if [ "$1" == "1" ]
  then
    eval "$3 &> $INSTALL_DIR/$2.log"
    should_continue "$2"
  fi
}

DEV_DIR=~/development/firefox
UPDATE=0
BUILD=1
INSTALL=0
DEBUG=0

while getopts “unihd?” OPTION
do
  case $OPTION in
    u)
      UPDATE=1 ;;
    i)
      INSTALL=1 ;;
    n)
      BUILD=0 ;;
    d)
      DEBUG=1 ;;
    h | ?)
      echo "$0 [-u] [-n] [-i] [-d]"
      echo '-u --> update'
      echo '-n --> do not build'
      echo '-i --> install'
      echo '-d --> use debug mozconfig'
      echo '-? | -h --> show this'
      exit ;;
     esac
done

if [ $DEBUG == 1 ] 
then
  export MOZCONFIG=".mozconfig-debug"
  INSTALL_DIR=~/ff-debug
else
  export MOZCONFIG=".mozconfig-release"
  INSTALL_DIR=~/ff
fi

rm -f $INSTALL_DIR/{build.log,update.log,install.log}

cd $DEV_DIR

exec_step "$UPDATE" "update" "hg pull -u"
exec_step "$BUILD" "build" "./mach build"
exec_step "$INSTALL" "install"  "./mach install"
