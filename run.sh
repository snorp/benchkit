#!/bin/bash

PS4='> '
set -x

adb root
adb shell setenforce 0
adb push system/xbin/* /data/local/tmp
adb shell /data/local/tmp/hackbench
adb shell /data/local/tmp/memcpy
adb shell /data/local/tmp/callbench
adb shell /data/local/tmp/stress-ng --memrate 0 --memrate-ops 5000 --memrate-bytes 1M
