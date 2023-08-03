#!/bin/bash

#Shell script for automounting gdrive using google-drive-ocamlfuse at startup (needs to be installed first) when on a wifi connection
#This file needs to be added to Ubuntu's startup applications


while true; do
  # check to see if there is a connection by pinging a Google server
  if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
    # if connected, mount the drive and break the loop
    google-drive-ocamlfuse /home/agentjay/gdrive; break;
  else
    # if not connected, wait for one second and then check again
    sleep 1
  fi
done
