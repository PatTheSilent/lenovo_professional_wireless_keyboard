#!/bin/bash
modprobe usbmon
if which usbmon; then
   stdbuf -i0 -o0 -e0 usbmon -i 1 -f0 | stdbuf -i0 -o0 -e0 grep -h -Po '\K[49]* = [0-9a-f ]*71$' | stdbuf -i0 -o0 -e0 tr -d ' ' | /usr/local/bin/kbdusb
else
   stdbuf -i0 -o0 -e0 grep -h -Po '\K[49]* = [0-9a-f ]*71$' /sys/kernel/debug/usb/usbmon/*u | stdbuf -i0 -o0 -e0 tr -d ' ' | /usr/local/bin/kbdusb
fi
