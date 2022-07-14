#!/bin/sh
set -e
# Project Dir

case $1 in
  daemon)
    /etc/init.d/ssh start
    /etc/init.d/ntp start
    tail -f /var/log/lastlog
    exit 0;
  ;;
  *)
    param="";
    for p in "$@" ; do
      param="$param \"$p\""
    done
    sh -c "sh ${param}"
  ;;
esac
