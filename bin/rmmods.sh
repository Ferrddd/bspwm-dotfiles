#!/bin/bash
#------------------------------------------AUDIO-----------------------------------------
systemctl stop --user pipewire-pulse.socket
systemctl stop --user pipewire.socket


list=$(lsmod | grep snd | awk '{print $1}')
for mod in $list; do
  sudo modprobe --remove --remove-dependencies $mod >> /dev/null 2>&1
done;

sudo modprobe --remove soundwire_generic_allocation
sudo modprobe --remove soundwire_bus

list=$(lsmod | grep snd | awk '{print $1}')
for mod in $list; do
  sudo modprobe --remove --remove-dependencies $mod >> /dev/null 2>&1
done;
#----------------------------------------------------------------------------------------
