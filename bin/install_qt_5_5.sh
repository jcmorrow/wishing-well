#!/bin/sh
#
# Install qt5.5 from cache if possible, otherwise download it

if [ ! -d /opt/qt55 ]; then
  echo "Could not find cached version of qt, downloading a fresh copy"
  sudo apt-get install apt -y
  sudo add-apt-repository ppa:beineri/opt-qt551 -y
  sudo apt-get update -y; true
  sudo apt-get install qt55webkit qt55declarative
  echo "source /opt/qt55/bin/qt55-env.sh" >> ~/.circlerc
fi
