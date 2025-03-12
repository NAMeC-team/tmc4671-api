#!/bin/bash

CWD=$(pwd)
[[ ! $(echo ${CWD} | grep "tmc4671-api") ]] && "Please run this script inside the root folder" && exit 1

TMP_WD="/tmp/tmc6471_tmp"
mkdir -p $TMP_WD 
cd $TMP_WD

git clone https://github.com/analogdevicesinc/TMC-API 2>/dev/null
cd "TMC-API/tmc/ic/TMC4671"
if [[ $(diff -rq . $CWD --exclude update.sh --exclude .git --exclude README.md) ]]
then
	set -e
	rm README.md
	cp ./* $CWD
	echo "TMC4671 API files have been updated to the latest revision"
else
	echo "TMC4671 API already up to date"
fi
