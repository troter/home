#!/bin/bash

for i in *; do [ -d $i ] && (echo -- $i; cd $i; superupdate); done
