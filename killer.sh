#!/bin/sh

kill -9 $(ps -aux | grep -m1 $1 | awk 'NR==1{print $2}')
